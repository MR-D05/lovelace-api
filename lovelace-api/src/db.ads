with App_Config;

package DB is

   --  procedure Add_User (User : in String);

   procedure DB_Connect (Config : in App_Config.Configuration);

   function Get_Password (User : in String) return String;

   function Get_Id (User : in String) return Integer;

   function Retrieve_Token (User : in String) return String;

   procedure Populate_Token (User : in String);

end DB;
