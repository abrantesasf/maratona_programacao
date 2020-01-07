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
PARA USO COM GCC 9.2
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

C17:    em 2017 uma versão com algumas correções para o C11 foi preparada e
        publicada e ficou conhecida por "C17". Essa versão foi publicada em 2018
        também conhecida por "iso899:2018".
        Para usar este padrão no GCC, use uma das opções abaixo:
           -std=c17
           -std=c18
           -std=iso9899:2017
           -std=iso9899:2018
        Note que as correções da C17 foram aplicadas na C11 no GCC, então ao usar
        a opção "-std=c11" as correções da C17 já estarão incorporadas (a única
        diferença será no valor de __STDC_VERSION__).


Extensões:
----------
Por padrão o GCC fornece algumas extensões aos padrões C listados acima (que,
em raras ocasiões, podem conflitar com os padrões). Essas versões da C com as
extensões da GCC podem ser utilizadas utilizando-se algumas das seguintes
opções:
           -std=gnu90 (C90 com as GNU Extensions)
           -std=gnu99 (C99 com as GNU Extensions)
           -std=gnu11 (C11 com as GNU Extensions)
           -std=gnu17 (C17 com as GNU Extensions)


Padrão C utilizado por default:
-------------------------------
Se nenhum padrão da C ou nenhum padrão com extensões for informado, o GCC
utilizará por default o padrão "gnu17", ou seja, o padrão C17 + Extensions.


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
#export PADRAO="-x c -std=c17"
export PADRAO="-std=c17"


# Formatação das mensagens de diagnóstico:
# ----------------------------------------
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export DIAG_MES_FMT="-fmessage-length=80 -fdiagnostics-color=always -fdiagnostics-generate-patch"


# Opções para warnings/erros:
# ---------------------------
export BASIC_ERROR_OPTIONS="-Werror -Wfatal-errors -Wall -Wextra"
export EXTRA_ERROR_OPTIONS="-Wchar-subscripts -Wdouble-promotion -Wduplicate-decl-specifier -Wformat=2 -Wformat-overflow=2 -Wformat-nonliteral -Wformat-security -Wformat-signedness -Wformat-y2k -Wformat-truncation=2 -Wnonnull -Wnonnull-compare -Wnull-dereference -Winit-self -Wimplicit-int -Wimplicit-function-declaration -Wimplicit -Wimplicit-fallthrough=3 -Wif-not-aligned -Wignored-qualifiers -Wignored-attributes -Wmain -Wmisleading-indentation -Wmissing-attributes -Wmissing-braces -Wmissing-include-dirs -Wmultistatement-macros -Wparentheses -Wsequence-point -Wreturn-type -Wshift-count-negative -Wshift-count-overflow -Wshift-negative-value -Wshift-overflow=2 -Wswitch -Wswitch-default -Wswitch-enum -Wswitch-bool -Wswitch-unreachable -Wsync-nand -Wunused-but-set-parameter -Wunused-but-set-variable -Wunused-function -Wunused-label -Wunused-local-typedefs -Wunused-parameter -Wunused-result -Wunused-variable -Wunused-const-variable -Wunused-value -Wunused -Wuninitialized -Winvalid-memory-model -Wmaybe-uninitialized -Wunknown-pragmas -Wstrict-aliasing=3 -Wstrict-overflow=4 -Wstringop-overflow=2 -Wstringop-truncation -Wsuggest-attribute=pure -Wsuggest-attribute=const -Wsuggest-attribute=noreturn -Wsuggest-attribute=format -Wmissing-format-attribute -Wsuggest-final-types -Wsuggest-final-methods -Walloc-zero -Warray-bounds -Wattribute-alias -Wbool-compare -Wbool-operation -Wduplicated-branches -Wduplicated-cond -Wframe-address -Wtautological-compare -Wtrampolines -Wfloat-equal -Wdeclaration-after-statement -Wshadow -Wunsafe-loop-optimizations -Wpointer-arith -Wpointer-compare -Wtype-limits -Wabsolute-value -Wcomment -Wtrigraphs -Wundef -Wexpansion-to-defined -Wbad-function-cast -Wcast-qual -Wcast-align -Wcast-function-type -Wwrite-strings -Wclobbered -Wconversion -Wdangling-else -Wdate-time -Wempty-body -Wenum-compare -Wjump-misses-init -Wsign-compare -Wsign-conversion -Wfloat-conversion -Wsizeof-pointer-div -Wsizeof-pointer-memaccess -Wsizeof-array-argument -Wmemset-elt-size -Wmemset-transposed-args -Waddress -Waddress-of-packed-member -Wlogical-op -Wlogical-not-parentheses -Waggregate-return -Wstrict-prototypes -Wold-style-declaration -Wold-style-definition -Wmissing-parameter-type -Wmissing-prototypes -Wmissing-declarations -Wmissing-field-initializers -Wnormalized=nfc -Woverride-init -Wpacked -Wpacked-bitfield-compat -Wpacked-not-aligned -Wpadded -Wredundant-decls -Wnested-externs -Winline -Wint-in-bool-context -Winvalid-pch -Wlong-long -Wvariadic-macros -Wvarargs -Wvector-operation-performance -Wno-vla -Wvolatile-register-var -Wpointer-sign -Wstack-protector -Woverlength-strings -Wunsuffixed-float-constants"


# Opções básicas para debug, teste ou bin:
# ----------------------------------------
export DBG="-O0 -g3 -v"
export TST="-O3 -g0 -v"
export BIN="-O3 -g0"


# Opções básicas para o código:
# -----------------------------
export CODE_OPTIONS="-fstrict-aliasing -fstrict-overflow -fipa-pure-const -fpic -fstack-check -fvisibility=default -fstack-usage -funsafe-loop-optimizations -fstack-protector-all -fstack-protector-all -fstack-protector-strong -fdiagnostics-color=always -fdiagnostics-show-option"


# Include de bibliotecas extras:
# ------------------------------
export EXTRALIBS="-lcs50"

# Executa a compilação:
# ---------------------
qtdArgs=($#)
export teste=0
if [ $qtdArgs -ne 3 ]; then
   echo ""
   echo "ERRO, você não chamou o comando corretamente. A sintaxe é:"
   echo ""
   echo "compilaC.sh <arquivo.c> <modo> <mantem>"
   echo ""
   echo "<modo> = d (debug)"
   echo "         t (test)"
   echo "         b (bin)"
   echo ""
   echo "<mantem> = 0 (mantém arquivos intermediários)"
   echo "           1 (apaga arquivos intermediários)"
   echo ""
else
   arq=`echo ${1%.c}`
   case "$2" in
      "d")
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Preprocessing..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Preprocessing:
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i ${EXTRALIBS}
          teste=($?)

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Compilation..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Compilation:
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Assembly..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Assembly
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Linking..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Linking
          ${CC} ${PADRAO} ${DBG} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} ${arq}.o -o ${arq} ${EXTRALIBS}
          teste=($?)
          fi
      ;;
      "t")
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Preprocessing..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Preprocessing:
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i ${EXTRALIBS}
          teste=($?)

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Compilation..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Compilation:
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Assembly..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Assembly
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Linking..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Linking
          ${CC} ${PADRAO} ${TST} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} ${arq}.o -o ${arq} ${EXTRALIBS}
          teste=($?)
          fi
      ;;
      "b")
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Preprocessing..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Preprocessing:
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -E ${arq}.c -o ${arq}.i ${EXTRALIBS}
          teste=($?)

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Compilation..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Compilation:
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -S ${arq}.i -o ${arq}.s ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Assembly..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Assembly
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} -c ${arq}.s -o ${arq}.o ${EXTRALIBS}
          teste=($?)
          fi

          if [ $teste -eq 0 ]; then
          echo ""
          echo ""
          echo "-----------------------------------------------------------------------------------"
          echo "Linking..."
          echo "-----------------------------------------------------------------------------------"
          sleep 0.1
          # Linking
          ${CC} ${PADRAO} ${BIN} ${CODE_OPTIONS} ${BASIC_ERROR_OPTIONS} ${EXTRA_ERROR_OPTIONS} ${arq}.o -o ${arq} ${EXTRALIBS}
          teste=($?)
          fi
      ;;
      *)
         echo ""
         echo "ERRO! O modo deve ser especificado como: d (debug), t (teste) ou b (binário)."
         echo ""
      ;;
   esac
   if [ $teste -eq 0 ]; then
      case "$3" in
         "1")
            echo ""
            echo ""
            echo "Compilação terminada. Apagando arquivos intermediários..."
            rm -f ${arq}.i
            rm -f ${arq}.s
            rm -f ${arq}.o
            rm -f ${arq}.su
         ;;
         "0")
            echo ""
            echo ""
            echo "Compilação terminada. Mantendo arquivos intermediários..."
         ;;
         *)
            echo ""
            echo ""
            echo "ERRO! O modo deve ser especificado como: 0 (mantém) ou 1 (apaga) arquivos intermediários."
            echo "Os arquivos foram mantidos!"
         ;;
      esac
   else
      echo ""
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
      echo "ERRO DURANTE O PROCESSO DE COMPILAÇÃO! Verifique seus arquivos!"
      echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
   fi
fi

