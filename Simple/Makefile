

# --------枚举头文件-------
HEADER 			= firstFuntion.h


# --------枚举OBJ文件-------
LIBOBJ 			= firstFunction.o

MAINOBJ 		= main.o

FTARGET 		= HelloWorld

all: ${FTARGET}

${FTARGET}: ${MAINOBJ} ${LIBOBJ}
	@echo Building HelloWorld
	g++ $^ -o ${FTARGET}

${MAINOBJ}: %.o:%.cpp
	@echo compiling main_o
	g++ -c $^

${LIBOBJ} : %.o:%.h
	@echo compiling firstFunction_o
	g++ -c $*.cpp


.PHONY : clean
clean: 
	rm -rf main.exe main.o first_function.o firstFunction.o HelloWorld firstFunction.h.gch




