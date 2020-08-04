with Application;
with GNATCOLL.JSON;         use GNATCOLL.JSON;

package Actions is

   function Get_Token
      (App : in Application.Application;
      Router_Input : in JSON_Value)
      return JSON_Value;

end Actions;
