with GNATCOLL.JSON;         use GNATCOLL.JSON;
with GNATCOLL.SQL;          use GNATCOLL.SQL;
with GNATCOLL.SQL.Postgres; use GNATCOLL.SQL.Postgres;
with GNATCOLL.SQL.Exec;     use GNATCOLL.SQL.Exec;
with GNATCOLL.SQL.Sessions; use GNATCOLL.SQL.Sessions;
with Ada.Text_IO;           use Ada.Text_IO;
with Database;              use Database;
with Token;                 use Token;

package body DB is

      DB_Descr : Database_Description;
      DB : Database_Connection;
      IsOpen : Boolean;

      procedure DB_Connect (Config : in App_Config.Configuration) is
            Config_JSON : constant JSON_Value
             := App_Config.Access_Config (Config);
            Database_Name : constant String := Get
             (Config_JSON, "Database");
            Postgres_User : constant String
             := Get (Config_JSON, "User");
            Postgres_Host : constant String
             := Get (Config_JSON, "Hostd");
            Postgres_Password : constant String
             := Get (Config_JSON, "Password");
      begin
            DB_Descr := Setup
                  (Database => Database_Name,
                  User => Postgres_User,
                  Host => Postgres_Host,
                  Password => Postgres_Password,
                  Errors => null);
            DB := DB_Descr.Build_Connection;
            IsOpen := DB.Check_Connection;
            if IsOpen then
                  Put_Line ("Connection is open.");
            else
                  Put_Line ("Last Db error = " & DB.Error);
            end if;
            Reset_Connection (DB);
      end DB_Connect;

      function Get_Password (User : in String) return String is
            Password_Hash : String (1 .. 60);
            Get_Password_Hash : constant Prepared_Statement :=
            Prepare (SQL_Select
                  (Fields => Public.Users.Password_Hash,
                  From => Public.Users,
                  Where => Public.Users.Username = Text_Param (1)),
            On_Server => True);
            R : Forward_Cursor;
      begin
            R.Fetch (DB, Get_Password_Hash, Params => (1 => +User));
            if R.Has_Row then
                  Password_Hash := R.Value (0);
                  return Password_Hash;
            else
                  Put_Line ("User does not exist");
                  return "User does not exist";
            end if;
      end Get_Password;

      function Get_Id (User : in String) return Integer is
            Grab_Id : constant Prepared_Statement :=
            Prepare
                  (SQL_Select
                        (Fields => Public.Users.Id,
                        From => Public.Users,
                        Where => Public.Users.Username
                         = Text_Param (1)),
                        On_Server => True);
            R : Forward_Cursor;
      begin
            R.Fetch (DB, Grab_Id, Params => (1 => +User));
            declare
                  User_Id : constant Integer
                   := Integer_Value (R, 0);
            begin
                  return User_Id;
            end;
      end Get_Id;

      procedure Populate_Token (User : in String) is
            --  pragma Unreferenced (User);
            User_Id : constant Integer := Get_Id (User);
            Token_Object : constant String := Token.Generate_Token;
            Insert_Token : constant Prepared_Statement :=
            Prepare
                  (SQL_Insert
                        (((Public.Api_Tokens.Id = Integer_Param (1))
                        & (Public.Api_Tokens.Token
                         = Text_Param (2))
                        & (Public.Api_Tokens.User_Id
                         = Integer_Param (3)))),
                        On_Server => True);
      begin
            DB.Execute
                  (Insert_Token, Params =>
                   (1 => +User_Id, 2 => +Token_Object, 3 => +User_Id));
            DB.Commit;
      end Populate_Token;

      function Retrieve_Token (User : in String) return String is
            --  pragma Unreferenced (User);
            User_Id : constant Integer := Get_Id (User);
            Token : String (1 .. 45);
            Get_Api_Token : constant Prepared_Statement :=
            Prepare
                  (SQL_Select
                        (Fields => Public.Api_Tokens.Token,
                        From => Public.Api_Tokens,
                        Where => Public.Api_Tokens.Id
                        = Integer_Param (1)),
                        On_Server => True);
            R : Forward_Cursor;
      begin
            R.Fetch (DB, Get_Api_Token, Params =>
                   (1 => +User_Id));
            if R.Has_Row then
                  Token := R.Value (0);
                  return Token;
            else
                  Populate_Token (User);
                  Token := Retrieve_Token (User);
                  return Token;
            end if;
      end Retrieve_Token;

end DB;
