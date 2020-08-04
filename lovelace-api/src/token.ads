with Ada.Numerics.Discrete_Random;

package Token is

   type Random_Type is range 0 .. 61;

   Random_Chars : constant array (Random_Type) of Character
        := "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

   package RNG is new Ada.Numerics.Discrete_Random (Random_Type);

   function Generate_Token return String;

end Token;
