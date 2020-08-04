with Ada.Characters.Latin_1;            use Ada.Characters.Latin_1;
with Ada.Text_IO;
with Gateway;

package body Lovelace_API_Callback is

   function CB
      (App : in Application.Application;
      Request : in String) return String is
      Response_Content : constant String := Gateway.GCB (App, Request);
   begin
      Ada.Text_IO.Put_Line (Response_Content);
      return Response_Content & LF;
   end CB;

end Lovelace_API_Callback;
