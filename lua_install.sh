#!/bin/bash
sudo yum -y install gcc
curl -L -C - -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar -xvzf lua-5.3.5.tar.gz
# gcc -std=gnu99 -O2 -Wall -Wextra -DLUA_COMPAT_5_2 -DLUA_USE_LINUX    -c -o lua.o lua.c
# lua.c:82:31: 致命错误：readline/readline.h：没有那个文件或目录
#  #include <readline/readline.h>                             ^
# 编译中断。
# make[2]: *** [lua.o] 错误 1
# make[2]: 离开目录“/home/ivan/pkgs/lua-5.3.5/src”
# make[1]: *** [linux] 错误 2
# make[1]: 离开目录“/home/ivan/pkgs/lua-5.3.5/src”
# make: *** [linux] 错误 2
sudo yum -y install readline-devel
# If you're running Linux and get compilation errors, make sure you have installed the readline development package (which is probably named libreadline-dev or readline-devel). If you get link errors after that, then try "make linux MYLIBS=-ltermcap".(http://www.lua.org/manual/5.3/readme.html#install)
cd lua-5.3.5
sudo make linux test
sudo make install
# cd src && mkdir -p /usr/local/bin /usr/local/include /usr/local/lib /usr/local/man/man1 /usr/local/share/lua/5.3 /usr/local/lib/lua/5.3
# cd src && install -p -m 0755 lua luac /usr/local/bin
# cd src && install -p -m 0644 lua.h luaconf.h lualib.h lauxlib.h lua.hpp /usr/local/include
# cd src && install -p -m 0644 liblua.a /usr/local/lib
# cd doc && install -p -m 0644 lua.1 luac.1 /usr/local/man/man1
