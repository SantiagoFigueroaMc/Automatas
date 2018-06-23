run:
	flex flex.l
	bison -d bison.y
	gcc -o program bison.tab.c lex.yy.c -ll
clean:
	rm *.yy.c
	rm *.tab.c
	rm *.tab.h
	rm program
