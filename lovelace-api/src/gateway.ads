with Application;
with Router;            use Router;

package Gateway is

   function GCB
      (App : in Application.Application;
      Request : in String) return String;

   function Get_Action_Type
      (Action_String : in String) return Action_Type;

end Gateway;
