with GNAT.Sockets;
with Application;

package Server is

      type Server_Callback is access function
            (App : in Application.Application;
            Request : String) return String;

      procedure Respond
            (App : in Application.Application;
            Request_Content : in String;
            Callback : in Server_Callback;
            Connection : in GNAT.Sockets.Socket_Type);

      procedure Run
            (Port : in Integer;
            App : in Application.Application;
            Callback : in Server_Callback);

      function Truncate_String
            (Input : in String;
            Max_Length : in Positive) return String;

end Server;
