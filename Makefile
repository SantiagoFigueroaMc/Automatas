run:
	flex len.l
	bison -d len.y
	gcc -o Comp len.tab.c lex.yy.c -ll
clean:
	rm *.yy.c
	rm *.tab.c
	rm *.tab.h
	rm Comp