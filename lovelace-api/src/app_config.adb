with Logging;           use Logging;
with File_Helper;
with JSON_File;
with Application;

package body App_Config is

   function Access_Config (Config : in Configuration) return JSON_Value is
   begin
      return Config.JSON;
   end Access_Config;

   procedure Acquire_Configuration (Config : in out Configuration) is 
      Config_String : constant String :=
      File_Helper.Read_File ("/root/config.json");
      Config_JSON : constant JSON_Value := JSON_File.Read (Config_String);
   begin
      Log (Application.App_Name, Info, "Reading config...");
      Config.JSON := Config_JSON;
      Log (Application.App_Name, Info, "Done reading config.");
   end Acquire_Configuration;

end App_Config;
