with GNATCOLL.JSON;             use GNATCOLL.JSON;
with GNATCOLL.Traces;           use GNATCOLL.Traces;
with Logging;                   use Logging;
with DB;                        use DB;
with App_Config;                use App_Config;
with Lovelace_API_Callback;
with Server;

package body Application is
   function Get_Config (App : in Application)
      return App_Config.Configuration is
   begin
      return App.Config;
   end Get_Config;

   procedure Initialize (App : in Application) is
      To_PSQL : App_Config.Configuration := Get_Config (App);
   begin
      Log (App_Name, Info, "Initializing.");
      App_Config.Acquire_Configuration (To_PSQL);
      DB.DB_Connect (To_PSQL);
      Log (App_Name, Info, "Done initializing.");
   end Initialize;

   procedure Run (App : in Application) is
      Port : constant Integer := 8080;
   begin
      GNATCOLL.Traces.Parse_Config_File (".gnatdebug");
      Initialize (App);
      Log (App_Name, Info, "Starting server on port " & Integer'Image (Port));
      Server.Run (Port, App, Lovelace_API_Callback.CB'Access);
      Log (App_Name, Info, "Stopped server");
   end Run;

end Application;
