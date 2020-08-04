with Application;

package Lovelace_API_Callback is

   function CB
      (App : in Application.Application;
      Request : in String) return String;

end Lovelace_API_Callback;
