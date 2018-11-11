#!/bin/bash
#
################################################################################
# compilaC.sh
################################################################################
#
# Este é um script para invocar o compilador GCC para compilar meus arquivos em
# C e correlatos. Muitas opções padrões já estão pré-definidas e as mais impor-
# tantes podem ser passadas através de parâmetros durante a chamada.
#
# Por: Abrantes Araújo Silva Filho
#      abrantesasf@gmail.com
#
################################################################################

# Explicações básicas
<< ////
====================
PARA USO COM GCC 5.x
====================

Padrões do C:
-------------
ANSI C: aqui existe uma confusão. O ANSI C foi ratificado em 1989 e publicado em 1990,
        por isso é conhecido por "C89" ou "C90" ou "C89/C90". Como o padrão ANSI C
	também foi ratificado pelo ISO, em 1990, também é conhecido por "iso9899:1990".
	Para usar este padrão no GCC, podemos informar qualquer uma das 3 opções abaixo,
	pois são a mesma coisa:
	   -ansi
	   -std=c89
	   -std=c90
	   -std=iso9899:1990

AMD1:   um "amendment" para o ANSI C foi ratificado em 1994 e publicado em 1995, e
        ficou conhecido por "C94" ou "C95" ou "C94/95". Esse novo padrão também foi
	ratificado pelo ISO, em 1994, e também ficou conhecido por "iso9899:199409".
	Para user este padrão no GCC, use a opção abaixo:
	   -std=iso9899:199409

C99:    em 1999 uma novo padrão foi publicado pelo ISO e ficou conhecido por "C99".
        Para usar este padrão no GCC, use uma das 2 opções abaixo:
	   -std=c99
	   -std=iso9899:1999

C11:    em 2011 um novo padrão foi publicado pelo ISO e ficou conhecido por "C11".
        Para usar este padrão no GCC, use uma das 2 opções abaixo:
	   -std=c11
	   -std=iso9899:2011


Opções para chamar o GCC para C:
--------------------------------
Preprocessing:
   Input:   código fonte
   Output:  código fonte processado
   Comando: gcc -E <file>.c -o <file>.i

Compilation:
   Input:   código fonte processado
   Output:  código assembler
   Comando: gcc -S <file>.i -o <file>.s

Assembly:
   Input:   código assembler
   Output:  object file
   Comando: gcc -c <file>.s -o <file>.o

Linking:
   Input:   object file
   Output:  executável
   Comando gcc <file>.o -o <file>".exe"
////

# Escolha do compilador:
# ----------------------
export CC="gcc"


# Escolha do padrão:
# ------------------
export PADRAO="-std=c89"


# Opções básicas para debug, teste ou bin:
# ----------------------------------------
export DBG="-O0 -g3 -v"
export TST="-O3 -g0 -v"
export BIN="-O3 -g0"


# Opções básicas para o código:
# -----------------------------
export CODE_OPTIONS="-pedantic -pedantic-errors -fpic -fstack-check -fvisibility=default -fcheck-pointer-bounds -fstrict-aliasing -fstrict-overflow -fipa-pure-const -fstack-usage -funsafe-loop-optimizations -fstack-protector -fdiagnostics-color=always -mmpx"


# Opções para warnings/erros:
# ---------------------------
export ERROR_OPTIONS="-Werror -Wfatal-errors -Wpedantic -Wall -Wextra -Wchkp -Wdouble-promotion -Wformat=2 -Wformat-signedness -Winit-self -Wmissing-include-dirs -Wshift-count-negative -Wshift-count-overflow -Wswitch-default -Wswitch-enum -Wswitch-bool -Wsync-nand -Wunused -Wuninitialized -Wmaybe-uninitialized -Wunknown-pragmas -Wstrict-aliasing=3 -Wstrict-overflow=4 -Wsuggest-attribute=pure -Wsuggest-attribute=const -Wsuggest-attribute=noreturn -Wsuggest-attribute=format -Wmissing-format-attribute -Wsuggest-final-types -Wsuggest-final-methods -Wbool-compare -Wfloat-equal -Wdeclaration-after-statement -Wundef -Wshadow -Wunsafe-loop-optimizations -Wpointer-arith -Wtype-limits -Wbad-function-cast -Wc90-c99-compat -Wc99-c11-compat -Wcast-qual -Wcast-align -Wwrite-strings -Wdate-time -Wjump-misses-init -Wconversion -Wsizeof-pointer-memaccess -Wsizeof-array-argument -Wmemset-transposed-args -Wlogical-op -Wlogical-not-parentheses -Waggregate-return -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wnormalized=nfc -Wpacked -Wpadded -Wredundant-decls -Wnested-externs -Winline -Winvalid-pch -Wvarargs -Wvector-operation-performance -Wvla -Wstack-protector -Woverlength-strings"


# Opções de cores:
# ----------------
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"


# Executa a compilação:
# ---------------------
if [ "S#" = "3" ]; then
   echo ""
   echo "ERRO, você chamou o comando corretamente. A sintaxe é:"
   echo "            compilaC.sh <arquivo.c> <modo> <mantem>"
   echo "onde <modo>   = d (debug), t (test) ou b (bin)"
   echo "e    <mantem> = 0 (mantém arquivos intermediários) ou 1 (apaga arquivos intermediários)"
   echo ""
else
   arq=`echo ${1%.c}`
   case "$2" in
      "d")
          # Preprocessing:
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i

          # Compilation:
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s

          # Assembly
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o

          # Linking
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${ERROR_OPTIONS}    ${arq}.o -o ${arq}
      ;;
      "t")
          # Preprocessing:
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i

          # Compilation:
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s

          # Assembly
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o

          # Linking
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${ERROR_OPTIONS}    ${arq}.o -o ${arq}
      ;;
      "b")
          # Preprocessing:
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i

          # Compilation:
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s

          # Assembly
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o

          # Linking
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${ERROR_OPTIONS}    ${arq}.o -o ${arq}
      ;;
      *)
         echo ""
         echo "ERRO! O modo deve ser especificado como: d (debug), t (teste) ou b (binário)."
         echo ""
      ;;
   esac
   case "$3" in
      "1")
         echo "Apagando arquivos intermediários..."
         rm -f ${arq}.i
         rm -f ${arq}.s
         rm -f ${arq}.o
         rm -f ${arq}.su
      ;;
      "0")
         echo "Mantendo arquivos intermediários..."
      ;;
      *)
         echo ""
         echo "ERRO! O modo deve ser especificado como: 0 (mantém) ou 1 (apaga) arquivos intermediários."
         echo "Os arquivos foram mantidos!"
      ;;
   esac
fi
