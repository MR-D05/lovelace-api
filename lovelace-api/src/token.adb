package body Token is

   G : RNG.Generator;

   function Generate_Token return String is
      Result : String (1 .. 45);
   begin
      RNG.Reset (G);
      for Index in Result'Range loop
         Result (Index) := Random_Chars (RNG.Random (G));
      end loop;
         return Result;
   end Generate_Token;

end Token;
