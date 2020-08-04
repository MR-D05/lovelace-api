with App_Config;

package Application is

   App_Name : constant String := "Lovelace API";
   type Application is tagged private;

   function Get_Config (App : in Application) return App_Config.Configuration;

   procedure Initialize (App : in Application);

   procedure Run (App : in Application);

private

   type Application is tagged record
      Config : App_Config.Configuration;
   end record;

end Application;
