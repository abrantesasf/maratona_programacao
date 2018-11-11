################################################################################
# Makefile para a aula 1
################################################################################ 

# Define diretórios importantes
SRC_DIR := src/
DBG_DIR := dbg/
TST_DIR := tst/
BIN_DIR := bin/

# Define objetos a serem compilados
INP_OBJS := $(SRC_DIR)teste.c
OUT_OBJS := teste.o
EXE_OBJS := teste

# Definições para o GCC e outros comandos:
CC     := gcc
PADRAO := -std=c90
DBG    := -O0 -g3 -v
TST    := -O3 -g0 -v
BIN    := -O3 -g0
OPCOES := -pedantic -pedantic-errors -fpic -fstack-check -fvisibility=default -fcheck-pointer-bounds -fstrict-aliasing -fstrict-overflow -fipa-pure-const -fstack-usage -funsafe-loop-optimizations -fstack-protector -fdiagnostics-color=always -mmpx
AVISOS := -Werror -Wfatal-errors -Wpedantic -Wall -Wextra -Wchkp -Wdouble-promotion -Wformat=2 -Wformat-signedness -Winit-self -Wmissing-include-dirs -Wshift-count-negative -Wshift-count-overflow -Wswitch-default -Wswitch-enum -Wswitch-bool -Wsync-nand -Wunused -Wuninitialized -Wmaybe-uninitialized -Wunknown-pragmas -Wstrict-aliasing=3 -Wstrict-overflow=4 -Wsuggest-attribute=pure -Wsuggest-attribute=const -Wsuggest-attribute=noreturn -Wsuggest-attribute=format -Wmissing-format-attribute -Wsuggest-final-types -Wsuggest-final-methods -Wbool-compare -Wfloat-equal -Wdeclaration-after-statement -Wundef -Wshadow -Wunsafe-loop-optimizations -Wpointer-arith -Wtype-limits -Wbad-function-cast -Wc90-c99-compat -Wc99-c11-compat -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Wdate-time -Wjump-misses-init -Wconversion -Wsizeof-pointer-memaccess -Wsizeof-array-argument -Wmemset-transposed-args -Wlogical-op -Wlogical-not-parentheses -Waggregate-return -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wnormalized=nfc -Wpacked -Wpadded -Wredundant-decls -Wnested-externs -Winline -Winvalid-pch -Wvarargs -Wvector-operation-performance -Wvla -Wstack-protector -Woverlength-strings -Wunsuffixed-float-constants

# Comandos
RM   := rm -f
LINK := ln -s -f

# Targets
dbg : $(DBG_DIR)$(OUT_OBJS)
	$(CC) $(PADRAO) $(DBG) $(OPCOES) $(AVISOS) -o $(DBG_DIR)$(EXE_OBJS) $(DBG_DIR)$(OUT_OBJS)
	$(LINK) $(DBG_DIR)$(EXE_OBJS) $(EXE_OBJS)
	
$(DBG_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(PADRAO) $(DBG) $(OPCOES) $(AVISOS) -c -o $(DBG_DIR)$(OUT_OBJS) $(INP_OBJS)

tst : $(TST_DIR)$(OUT_OBJS)
	$(CC) $(PADRAO) $(TST) $(OPCOES) $(AVISOS) -o $(TST_DIR)$(EXE_OBJS) $(TST_DIR)$(OUT_OBJS)
	$(LINK) $(TST_DIR)$(EXE_OBJS) $(EXE_OBJS)

$(TST_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(PADRAO) $(TST) $(OPCOES) $(AVISOS) -c -o $(TST_DIR)$(OUT_OBJS) $(INP_OBJS)

bin : $(BIN_DIR)$(OUT_OBJS)
	$(CC) $(PADRAO) $(BIN) $(OPCOES) $(AVISOS) -o $(BIN_DIR)$(EXE_OBJS) $(BIN_DIR)$(OUT_OBJS)
	$(LINK) $(BIN_DIR)$(EXE_OBJS) $(EXE_OBJS)

$(BIN_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(PADRAO) $(BIN) $(OPCOES) $(AVISOS) -c -o $(BIN_DIR)$(OUT_OBJS) $(INP_OBJS)

clean :
	$(RM) $(DBG_DIR)$(OUT_OBJS)
	$(RM) $(TST_DIR)$(OUT_OBJS)
	$(RM) $(BIN_DIR)$(OUT_OBJS)

distclean : clean
	$(RM) $(DBG_DIR)$(EXE_OBJS)
	$(RM) $(TST_DIR)$(EXE_OBJS)
	$(RM) $(BIN_DIR)$(EXE_OBJS)
	$(RM) $(EXE_OBJS)
