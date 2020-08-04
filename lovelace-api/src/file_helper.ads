package File_Helper is

   function Read_File (Filename : in String) return String;

   procedure Write_File (Filename, Content : in String);

end File_Helper;
