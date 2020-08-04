with GNATCOLL.JSON;         use GNATCOLL.JSON;
with JSON_File;

package body Gateway is

      function GCB
            (App : in Application.Application;
            Request : in String) return String is
            --  pragma Unreferenced (App);
            Router_Input : constant JSON_Value := JSON_File.Read (Request);
            Action_Key : constant String := "action";
            Action_String : constant String := Get (Router_Input, Action_Key);
            Action : constant Action_Type := Get_Action_Type (Action_String);
            Response_Content : constant JSON_Value
            := Router.RCB (App, Router_Input, Action);
      begin
            return Write (Response_Content);
      end GCB;

      function Get_Action_Type
            (Action_String : in String) return Action_Type is
      begin
            return Action_Type'Value (Action_String);
      exception
            when Constraint_Error =>
                  return Invalid;
      end Get_Action_Type;

end Gateway;
