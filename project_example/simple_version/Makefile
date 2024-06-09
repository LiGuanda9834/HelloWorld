all: HelloWorld

HelloWorld: main.o firstFunction.o
	@echo Building HelloWorld
	g++ main.o firstFunction.o -o HelloWorld

main.o: main.cpp firstFunction.h
	@echo compiling main_o
	g++ -c main.cpp

firstFunction.o : firstFunction.cpp firstFunction.h
	@echo compiling firstFunction_o
	g++ -c firstFunction.cpp

.PHONY : clean
clean: 
	rm -rf main.exe main.o first_function.o firstFunction.o HelloWorld