-------------------------------------------------------------------------------
--                                                                           --
--                     Copyright (C) 2012-, AdaHeads K/S                     --
--                                                                           --
--  This is free software;  you can redistribute it and/or modify it         --
--  under terms of the  GNU General Public License  as published by the      --
--  Free Software  Foundation;  either version 3,  or (at your  option) any  --
--  later version. This library is distributed in the hope that it will be   --
--  useful, but WITHOUT ANY WARRANTY;  without even the implied warranty of  --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     --
--  You should have received a copy of the GNU General Public License and    --
--  a copy of the GCC Runtime Library Exception along with this program;     --
--  see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
--  <http://www.gnu.org/licenses/>.                                          --
--                                                                           --
-------------------------------------------------------------------------------

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;

with ESL.Client.Tasking;
with ESL.Packet_Keys;
with ESL.Client.Tasking.Test_Utilities;

with ESL;
with ESL.Trace;
with ESL.Job.List;
with ESL.Command.Call_Management;

procedure ESL.Client.Tasking.Job_Test is
   use ESL;
   use ESL.Trace;
   use Client.Tasking.Test_Utilities;
   use ESL.Reply;

   Testobs1 : Re_Schedule_Observer
     (Observing => Event_Stream
        (Client => Test_Client'Access,
         Stream => ESL.Packet_Keys.RE_SCHEDULE));
   pragma Unreferenced (Testobs1);

   Testobs2 : Heartbeat_Observer
     (Observing => Event_Stream
        (Client => Test_Client'Access,
         Stream => ESL.Packet_Keys.HEARTBEAT));
   pragma Unreferenced (Testobs2);

   Command : constant ESL.Command.Call_Management.Instance :=
     ESL.Command.Call_Management.Originate
       (Call_URL         => "user/1001",
        Extension        => "5900");

   procedure Usage;

   procedure Usage is
   begin
      Put_Line ("Usage:" & Command_Name & " hostname port password");
      Set_Exit_Status (Failure);
   end Usage;

   task Tasking_Connect is
      entry Start;
   end Tasking_Connect;

   task body Tasking_Connect is
   begin
      accept Start;
         Client.Tasking.Test_Utilities.Set_Connection_Parameters
           (New_Hostname => Argument (1),
            New_Port     => Natural'Value (Argument (2)),
            New_Password => Argument (3));
      while not Test_Client.Is_Shutdown loop
         if not Test_Client.Connected then
            Test_Client.Connect
              (Argument (1), Natural'Value (Argument (2)));
         end if;
         delay 1.0;
      end loop;
   end Tasking_Connect;

   Delay_Count    : Natural := 0;
   Reply          : ESL.Reply.Instance;
   Job            : ESL.Job.Instance;
   BGAPI_Observer : ESL.Job.List.Job_Observer
     (Observing => Event_Stream
        (Client => Test_Client'Access,
         Stream => ESL.Packet_Keys.BACKGROUND_JOB));

begin
   ESL.Trace.Unmute (ESL.Trace.Every);

   if Argument_Count < 3 then
      Usage;
      Shutdown (Test_Client);
      return;
   end if;

   Tasking_Connect.Start;

   while not Test_Client.Connected loop
      delay 1.0;

      if Delay_Count = 30 then
         raise Program_Error with
           "Test expected valid Freeswitch PBX - none found.";
      end if;
      Delay_Count := Delay_Count + 1;
   end loop;

   declare
   begin
      Ada.Text_IO.Put ("Expecting authentication to succeed .. ");
      Test_Client.Authenticate
        (Password => Argument (3));
      Put_Line ("OK.");
   exception
      when Authentication_Failure =>
         Put_Line ("Failed.");
         Set_Exit_Status (Failure);
   end;

   delay 1.0;

   Test_Client.Unmute_Event
     (Event => ESL.Packet_Keys.BACKGROUND_JOB);

   Ada.Text_IO.Put ("Sending BG_API command, discarding - ");
   Test_Client.Background_API (Command => Command,
                                                        Reply   => Reply);
   Ada.Text_IO.Put_Line ("Got reply: " & Reply.Image & " waiting for packet.");

   BGAPI_Observer.Job_List.Subscribe (UUID => Reply.UUID);

   BGAPI_Observer.Job_List.Wait_For (UUID => Reply.UUID,
                                     Job  => Job);

   Ada.Text_IO.Put_Line ("Got Job: " & Job.Image);

   Shutdown (Test_Client);

exception
   when E : others =>
      Put_Line (Ada.Exceptions.Exception_Information (E));

end ESL.Client.Tasking.Job_Test;
