C	= gcc
CINCS  	= -I"include/" -I"src/"
CFLAGS 	= $(CINCS) -std=c11 -O2 -lfl
SRCS	= $(shell find src -name '*.c' -and -not -name 'lex.yy.c' -and -not -name 'parser.c') src/lex.yy.c src/parser.c
OBJ		= $(addprefix obj/,$(notdir $(SRCS:%.c=%.o))) 
LEXICAL = lexical-analyzer
BIN     = exe
RM      = rm -f

.PHONY: all all-before all-after clean clean-custom

all: all-before $(LEXICAL) all-after

debug: CFLAGS = -DDEBUG $(CINCS) -std=c11 -lfl -g3 -ggdb3 -Wall -Wextra -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -Wno-unused-parameter 
debug: all

clean: clean-custom
	${RM} $(OBJ) $(BIN) src/yy.lex.cc src/parser.c src/parser.h

$(LEXICAL): bison flex compile

flex: 
	flex -o src/lex.yy.c src/tokenizer.lex

bison:
	bison -o src/parser.c src/parser.y -d -v

compile: $(OBJ)
	$(C) $(OBJ) -o $(BIN) $(CFLAGS)

obj/%.o: src/%.c
	$(C) -c $< -o $@ $(CFLAGS)
