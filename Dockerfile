FROM haxe:3.4.7-alpine

RUN haxelib install hxcpp 4.0.19

RUN apk add --no-cache bash gawk sed grep bc coreutils g++ \
 && ln -s /usr/include/locale.h /usr/include/xlocale.h
