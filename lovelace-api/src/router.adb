with Actions;
with System.Assertions;

package body Router is

      Invalid_Action_Exception : exception;

      function Error_JSON (Msg : in String) return JSON_Value;

      function Error_JSON (Msg : in String) return JSON_Value is
            Error : constant JSON_Value := Create_Object;
      begin
            Set_Field
                  (Val => Error,
                  Field_Name => "Error",
                  Field => Msg);
                        return Error;
      end Error_JSON;

      function RCB
            (App : in Application.Application;
            Router_Input : in JSON_Value;
            Action : in Action_Type)
            return JSON_Value is
            Generated_Data : constant JSON_Value
            := Actions.Get_Token (App, Router_Input);
      begin
            case Action is
                  when Get_Token =>
                        return Generated_Data;
            when others =>
                  raise Invalid_Action_Exception;
            end case;
      exception
            when System.Assertions.Assert_Failure =>
                  return Error_JSON ("Failure");
            when others =>
                  return Error_JSON ("Failed to process request.");
      end RCB;

end Router;
