with BCrypt;            use BCrypt;
with DB;                use DB;
with Ada.Text_IO;       use Ada.Text_IO;

package body Actions is

      function Get_Token
            (App : in Application.Application;
            Router_Input : in JSON_Value) return JSON_Value is
            pragma Unreferenced (App);
            User : constant String := Get (Router_Input, "user");
            Password : constant String := Get (Router_Input, "password");
            Session_Token : constant JSON_Value := Create_Object;
            Error_JSON_Message : constant JSON_Value := Create_Object;
            Password_Hash : constant String := Get_Password (User);
            Token : constant String := Get_Token (User);
            Verified : Boolean;
      begin
            Verified := Check_PW (Password, Password_Hash);
            if Verified then
                  Put_Line ("User has been verified.");
                  Set_Field
                        (Val => Session_Token,
                        Field_Name => "Token",
                        Field => Token);
                              return Session_Token;
            else
                  Set_Field
                        (Val => Error_JSON_Message,
                        Field_Name => "Error",
                        Field => "Incorrect password.");
                              return Error_JSON_Message;
            end if;
      end Get_Token;

end Actions;
