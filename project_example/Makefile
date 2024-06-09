# ---------环境变量--------

CC 			= g++
CC_o 		= -o
CC_c 		= -c
VER 		= 1.0 		# 用于设置不同的编译调试模式（选择不同的g++/gdb参数）
ARCH		= ar		# 用于设置打包方式，打包可以用来生成库文件
ARCHFLAGS	= cr

# -------- 设置编译模式 ----------
ifeq ($(VER), debug)
	CFLAGS = -g
else
	CFLAGS = -MM
endif

# -------- 设置路径与依赖---------
CUR_DIR 	:= $(shell pwd) 
SRCDIR 		= #
MAINDIR 	= #

BINDIR		=
OBJDIR		=
LIBDIR 		= #

LIBOBJDIR 	= 			
BINOBJDIR	= 			# 可执行文件路径，比如main.o的路径

# --------依赖文件---------
MAINDEP 	=

# --------枚举头文件-------
HEADER 			= firstFuntion.h


# --------枚举OBJ文件-------
LIBOBJ 			= firstFunction.o

MAINOBJ 		= main.o
MAINBIN 		= HelloWorld

# --------设置SRC文件-------
LIBSRC 			= $(addprefix $(SRCDIR)/,$(LIBOBJ:.o=.cpp))
MAINSRC 		= $(addprefix $(MAINDIR)/,$(MAINOBJ:.o=.cpp))

CPPFILE			= $(LIBSRC) $(MAINSRC)

# --------设置头文件所在目录-------
LIBSRCHEADER	= $(addprefix $(SRCDIR)/,$(HEADER))

# --------设置可执行文件与OBJ文件？-------
MAINOBJFILES 	= $(addprefix $(BINOBJDIR)/,$(MAINOBJ))
LIBOBJFILES		= $(addprefix $(LIBOBJDIR)/,$(LIBOBJ))


# -------- 主要目标：添加依赖的各种路径，生成库文件，并最终生成二进制文件 ------
# -------- 到几个子文件夹（路径）中找Makefile --------
all: $(LIBDIR) $(BINDIR) $(OBJDIR) $(LIBOBJDIR) $(BINOBJDIR) $(LIBFILE)	$(BINFILE)
	@-$(MAKE) $(LIBDIR) $(BINDIR) $(OBJDIR) $(LIBOBJDIR) $(BINOBJDIR)

# -------- 生成自己的库，依赖于库的路径、.o文件与.h文件 --------
$(LIBFILE):$(LIBOBJDIR) $(LIBDIR) $(LIBOBJFILES) $(LIBSRCHEADER) 
	$(ARCH) $(ARCHFLAGS) $@ $(LIBOBJFILES) $(LPIOBJFILE) $(APIOBJFILE)

# -------- 生成路径，用于保证上述这些路径都存在 --------
$(LIBDIR):
	@-mkdir -p $(LIBDIR)

# -------- 生成二进制库文件，依赖于库文件和main.o -------
# -------- -Wall 代表warn all  --------
$(BINLIBFILE):$(LIBFILE) $(MAINOBJFILES) #在目标中就包含了路径，在生成文件的时候会自动生成到路径中
	g++ -Wall $(MAINOBJFILES) $(LIBFILE)		

# -------- 把.cpp文件编译为.o文件 --------
-include $(CMIPDEP)
-include $(MAINDEP)
$(LIBOBJDIR)/%.o:$(SRCDIR)/%.cpp
	$(CXX) -c $(CFLAGS) $(CMIPFLAGS) $< -o $@
$(MAINOBJFILES):$(MAINSRC) 
	$(CXX) -c $(CFLAGS) $(CMIPFLAGS) $< -o $@

# -------- 生成依赖文件 --------
.PHONY:cmipdepend
cmipdepend:
	$(CXX) $(MMFLAGS) -MM $(LIBSRC) | sed 's|^\([0-9A-Za-z\_]*\)\.o*|$(LIBOBJDIR)/\1.o|g' > ${CMIPDEP}

.PHONY:maindepend
maindepend:
	$(CXX) $(MMFLAGS) -MM $(MAINSRC) | sed 's|^\([0-9A-Za-z\_]*\)\.o*|$(LIBOBJDIR)/\1.o|g' > ${MAINDEP}


# -------- clean ---------
.PHONY:clean
clean:
	@-rm -f $(LIBOBJ)
	@-rm -rf $(LIBDIR)
	@-rm -rf $(BINDIR)
#这里必须先删除两个子目录，不然会出错
	@-rm -rf $(LIBOBJDIR)
	@-rm -rf $(BINOBJDIR)
	@-rm -rf $(OBJDIR)
	@-rm  -f ./check/bin/$(BINFILE)

subsystem:
	cd src && ${MAKE}

clean:
	rm -rf main.o