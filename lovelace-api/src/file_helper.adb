with Ada.Direct_IO;
with Ada.Directories;

package body File_Helper is

      function Read_File (Filename : in String) return String is
            File_Size : constant Natural
            := Natural (Ada.Directories.Size (Filename));
            subtype File_String is String (1 .. File_Size);
            package File_String_IO is new Ada.Direct_IO (File_String);
            File : File_String_IO.File_Type;
            String_Content : File_String;
      begin
            File_String_IO.Open
                  (File => File,
                  Mode => File_String_IO.In_File,
                  Name => Filename);
            File_String_IO.Read
                  (File => File,
                  Item => String_Content);
            File_String_IO.Close
                  (File => File);
                  return String_Content;
      end Read_File;

      procedure Write_File
            (Filename, Content : in String) is
            subtype File_String is String (Content'Range);
            package File_String_IO is new Ada.Direct_IO (File_String);
            File : File_String_IO.File_Type;
      begin
            File_String_IO.Create
                  (File => File,
                  Name => Filename);
            File_String_IO.Write
                  (File => File,
                  Item => Content);
            File_String_IO.Close
                  (File);
      end Write_File;

end File_Helper;
