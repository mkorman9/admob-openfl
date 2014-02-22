#!/bin/sh

haxelib run hxlibc Build.xml -Diphoneos
haxelib run hxlibc Build.xml -Diphoneos -DHXCPP_ARMV7
haxelib run hxlibc Build.xml -Diphonesim
haxelib run hxlibc Build.xml
