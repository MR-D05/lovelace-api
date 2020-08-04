with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces.C;
with bcrypt_h; use bcrypt_h;

package body BCrypt is
   function Check_PW (Password, Hash : in String) return Boolean is
   begin
      if Integer (
            bcrypt_checkpw (
               New_String (Password),
               New_String (Hash)
            )
         ) = 0
      then
         return True;
      else
         return False;
      end if;
   end Check_PW;
end BCrypt;
