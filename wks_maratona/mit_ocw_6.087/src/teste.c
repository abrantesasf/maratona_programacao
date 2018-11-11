/*
================================================================================
Name        : .c
Description : 
Author      : Abrantes Araújo Silva Filho
            :   abrantesasf@gmail.com
            :   http://www.abrantesfilho.com
C Standard  : C89/C90
Version     : 
Copyright   : 
More Info   : 
================================================================================
*/


/* Headers files includes:
--------------------------
   #include <header_file.h>
   Important headers: stdio.h, stdlib.h, ctype.h, math.h, string.h, time.h
*/
#include <stdio.h>
#include <stdlib.h>


/* Preprocessor macros/definitions:
-----------------------------------
   #define <name> <value>
   #define <name> (arg1, arg2, arg3, ...) (<commands>)

   Conditional preprocessor macros: ("gcc -D<name>=<value>" sets a preprocessor define)
   #if, #ifdel, #ifndef, #else, #elif #endif

   Other preprocessor macros:
   #pragma, #error, #warning, #undef
*/
#define rSucesso 0


/* Global variables declarations:
---------------------------------
   <type> <name> = <value>;
   <type> <name>, <name>, <name> = <value>, <name> = <value>;
   <type> <name>;
   <name> = <value>;

   char, int, float
   const

     char -> 'a'
   string -> "abrantes" (armazena como array de char; null-terminated: '\0')
   special characters -> \ ' " \b \t \r \n \ooo \xhh
*/


/* Functions prototypes:
------------------------
   <return_type> <function_name> (<type> arg1, <type> arg2, ...) {}
   <return_type> <function_name> (void) {}
*/


/* Main function:
-----------------
   <return_type> main (void) {}
   <return_type> main (int argc, char **argv) {}
*/
int main(void) {
  puts("Olá, Abrantes!");
  return rSucesso;
}


/* Functions definitions:
-------------------------
*/
