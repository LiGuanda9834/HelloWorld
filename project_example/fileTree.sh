File Tree of Project Dada with method Debug
NAME = Dada_Debug

Dada                                # CUR_DIR                        
|-- src                             # MAINDIR = src
    |-- main.cpp                    # MAINSRC = $(addprefix $(MAINDIR)/,$(MAINOBJ:.o=.cpp))           
    |-- Dada_1                      # SRCDIR = src/Dada_1                   头文件和源代码
    |   |-- DadaFile1.h             # LIBSRCHEADER = $(addprefix $(SRCDIR)/,$(HEADER))
    |   |-- DadaFile2.h             # HEADER = Dadafile1.h                  头文件
    |   |-- DadaFile1.cpp           # LIBSRC = $(addprefix ...)             源文件
    |   |-- DadaFile2.cpp
    |-- maindepend                  # MAINDEP = src/maindepend              main 的依赖路径
|-- bin                             # BINDIR = bin
    |-- Dada_debug                  # BINFILE = ${BINDIR}/${NAME},          最终生成的二进制文件
    |-- libDada_debug               # BINLIBFILE = ${BINDIR}/lib${NAME}     二进制文件的库（？？？）
|-- lib                             # LIBDIR = lib
    |-- Dada_debug.a                # LIBFILE = ${LIBDIR}/${NAME}.a
|-- OBJ
    |-- Debug                       # OBJDIR = OBJ/CC_V1                    以V_1的方式进行编译得到的OBJ文件
        |-- lib                     # LIBOBJDIR = $(OBJDIR)/lib             
            |-- DadaFile1.o         # LIBOBJ = Dadafile1.o                  库的OBJ文件
            |                       # LIBOBJFILES = $(addprefix $(LIBOBJDIR)/,$(LIBOBJ))
            |-- DadaFile2.o
        |-- bin                     # BINOBJDIR = $(OBJDIR)/bin    
            |-- main.o              # MAINOBJ = main.o                      Main函数的OBJ文件
                                    # MAINOBJFILES = $(addprefix $(BINOBJDIR)/,$(MAINOBJ))
|-- include                         #                                       用于某一次具体编译中包含全部的#include文件 
|-- check                           #                                       用于检查