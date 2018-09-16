################################################################################
# Makefile para a aula 1
################################################################################ 

# Define diretórios importantes
SRC_DIR := src/
DBG_DIR := dbg/
TST_DIR := tst/
BIN_DIR := bin/

# Define objetos a serem compilados
INP_OBJS := $(SRC_DIR)aula1.c
OUT_OBJS := aula1.o
EXE_OBJS := aula1

# Definições para o GCC e outros comandos:
CC        := gcc
FLAGS_DBG := -std=c90 -O0 -g3 -Wall -Wextra -Werror -Wconversion -Wfloat-equal -Wformat -Wswitch-default -Wswitch-enum -fpic -v 
FLAGS_TST := -std=c90 -O0     -Wall -Wextra -Werror -Wconversion -Wfloat-equal -Wformat -Wswitch-default -Wswitch-enum -fpic -v
FLAGS_BIN := -std=c90 -O3     -Wall -Wextra -Werror -Wconversion -Wfloat-equal -Wformat -Wswitch-default -Wswitch-enum -fpic

# Comandos
RM := rm -f
LINK := ln -s -f

# Targets
dbg : $(DBG_DIR)$(OUT_OBJS)
	$(CC) $(FLAGS_DBG) -o $(DBG_DIR)$(EXE_OBJS) $(DBG_DIR)$(OUT_OBJS)
	$(LINK) $(DBG_DIR)$(EXE_OBJS) $(EXE_OBJS)
	
$(DBG_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(FLAGS_DBG) -c -o $(DBG_DIR)$(OUT_OBJS) $(INP_OBJS)

tst : $(TST_DIR)$(OUT_OBJS)
	$(CC) $(FLAGS_TST) -o $(TST_DIR)$(EXE_OBJS) $(TST_DIR)$(OUT_OBJS)
	$(LINK) $(TST_DIR)$(EXE_OBJS) $(EXE_OBJS)

$(TST_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(FLAGS_TST) -c -o $(TST_DIR)$(OUT_OBJS) $(INP_OBJS)

bin : $(BIN_DIR)$(OUT_OBJS)
	$(CC) $(FLAGS_BIN) -o $(BIN_DIR)$(EXE_OBJS) $(BIN_DIR)$(OUT_OBJS)
	$(LINK) $(BIN_DIR)$(EXE_OBJS) $(EXE_OBJS)

$(BIN_DIR)$(OUT_OBJS) : $(INP_OBJS)
	$(CC) $(FLAGS_BIN) -c -o $(BIN_DIR)$(OUT_OBJS) $(INP_OBJS)

clean :
	$(RM) $(DBG_DIR)$(OUT_OBJS)
	$(RM) $(TST_DIR)$(OUT_OBJS)
	$(RM) $(BIN_DIR)$(OUT_OBJS)

distclean : clean
	$(RM) $(DBG_DIR)$(EXE_OBJS)
	$(RM) $(TST_DIR)$(EXE_OBJS)
	$(RM) $(BIN_DIR)$(EXE_OBJS)
	$(RM) $(EXE_OBJS)