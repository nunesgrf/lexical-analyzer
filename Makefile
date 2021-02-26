C	= gcc
CINCS  	= -I"include/" -I"src/"
CFLAGS 	= $(CINCS) -std=c11 -O2 -ll
SRCS	= $(shell find src -name '*.c' -and -not -name 'lex.yy.c') src/lex.yy.c
OBJ		= $(addprefix obj/,$(notdir $(SRCS:%.c=%.o))) 
LEXICAL = lexical-analyzer
BIN     = exe
RM      = rm -f

.PHONY: all all-before all-after clean clean-custom

all: all-before $(LEXICAL) all-after

debug: CFLAGS = -DDEBUG $(CINCS) -std=c11 -ll -g3 -ggdb3 -Wall -Wextra -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -Wno-unused-parameter 
debug: all

clean: clean-custom
	${RM} $(OBJ) $(BIN) src/yy.lex.cc

$(LEXICAL): flex compile

flex: 
	flex -o src/lex.yy.c src/main.l

compile: $(OBJ)
	$(C) $(OBJ) -o $(BIN) $(CFLAGS)

obj/%.o: src/%.c
	$(C) -c $< -o $@ $(CFLAGS)
