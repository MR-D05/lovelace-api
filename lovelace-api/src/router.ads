with Application;
with GNATCOLL.JSON;         use GNATCOLL.JSON;

package Router is

      type Action_Type is (Get_Token, Invalid);

      function RCB
            (App : in Application.Application;
            Router_Input : in JSON_Value;
            Action : in Action_Type)
                  return JSON_Value;

end Router;
