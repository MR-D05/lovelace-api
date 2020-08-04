with Ada.Text_IO;           use Ada.Text_IO;

package body Logging is

   procedure Log
      (App_Name : in String;
      Msg_Level : in Level;
      Msg : in String) is
   begin
      Put_Line (App_Name & ": [" & Level'Image (Msg_Level) & "]: " & Msg);
   end Log;

end Logging;
