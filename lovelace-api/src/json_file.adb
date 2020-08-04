package body JSON_File is

   function Read
      (Filename : in String) return JSON_Value is
      Value : JSON_Value := Create_Object;
   begin
      Value := Read (Filename, "json.errors");
      return Value;
   end Read;
end JSON_File;
