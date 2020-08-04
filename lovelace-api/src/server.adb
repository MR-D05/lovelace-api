with Logging;                   use Logging;
with Ada.Exceptions;            use Ada.Exceptions;
with Ada.Characters.Latin_1;    use Ada.Characters.Latin_1;
with Ada.IO_Exceptions;
with GNAT.Sockets.Convenience;
with Black.Request;
with Black.Response;

package body Server is

      procedure Respond
            (App : in Application.Application;
            Request_Content : in String;
            Callback : in Server_Callback;
            Connection : in GNAT.Sockets.Socket_Type) is
            Response_Content : constant String
            := Callback (App, Request_Content);

      begin
            Black.Response.Instance'Output
            (GNAT.Sockets.Stream (Connection),
            Black.Response.OK (Data => Response_Content));
      end Respond;

      procedure Run
            (Port : in Integer;
            App : in Application.Application; Callback : in Server_Callback) is
            use GNAT.Sockets;
            Listener : Socket_Type;
      begin
            Listener := Convenience.Make_Server (Port => Port_Type (Port));
            loop
                  declare
                        Connection : Socket_Type;
                        Client     : Sock_Addr_Type;
                  begin
                        Accept_Socket
                        (Server => Listener,
                        Socket => Connection,
                        Address => Client);
                              declare
                                    Request : Black.Request.Instance;
                              begin
                                    Request :=
                                    Black.Request.Parse_HTTP
                                          (Stream (Connection));
                                    Log ("Lovelace API", Info, Request.Content);
                                    Respond
                                          (App, Request.Content,
                                          Callback, Connection);
                              exception
                                    when Black.Request.No_Content_Length =>
                                    Respond (App, "", Callback, Connection);
                              end;
                        Close_Socket (Socket => Connection);
                  exception
                        when Ada.IO_Exceptions.End_Error => null;
                        when Error : others =>
                        Log
                              ("Lovelace API Server",
                              Logging.Error,
                              "Exception in Server loop: " & LF & "  " &
                              Exception_Information (Error));
                  end;
            end loop;
      end Run;

      function Truncate_String
            (Input : in String; Max_Length : in Positive)
                  return String is
            Tail : constant String := " ... (Long String truncated)";
      begin
            if Input'Length > Max_Length then
                  return Input (Input'First .. Max_Length) & Tail;
            else
                  return Input;
            end if;
      end Truncate_String;

end Server;
