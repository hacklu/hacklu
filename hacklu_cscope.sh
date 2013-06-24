#!/bin/sh
a=`pwd`
find $a -name "*.h" -o -name "*.c" -o -name "*.S" -o -name "*.s" -o -name "*.cpp" > cscope.files
cscope -bkq -i cscope.files
ctags -R
