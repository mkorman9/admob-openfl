Google AdMob extension for OpenFL applications. Working on both Android and iOS. Code is heavily based on NMEX extension which is pretty much outdated right now.

**Instructions**

1. Copy admob directory to your Haxe/libs directory
2. Import extension in your project.xml file ```<haxelib name="admob" /> ```
3. Import AD class ```import admob.AD; ```
4. Setup ads at the beginning of your code ```AD.init(ADMOB_ID, AD.LEFT, AD.BOTTOM, AD.BANNER, false);```
where arguments are following:
  - Ad unit id.
  - Position in x axis. Could be ```AD.LEFT``` or ```AD.RIGHT```
  - Position in y axis. Could be ```AD.TOP``` or ```AD.BOTTOM```
  - Banner size. Could be ```haxe AD.BANNER```, ```AD.SMART_BANNER_PORTRAIT``` or ```AD.SMART_BANNER_LANDSCAPE``` (see google's documentation)
  - Test mode. Whether enable ads in test mode or not. Default value is false.
5. Show banner ```AD.show(); ```
6. You can hide it anytime by calling ```AD.hide();```

**Prerequisites on iOS**

1. Add following code to your project.xml 
```xml
<ios linker-flags="-force_load /usr/lib/haxe/lib/admob/1_1_0/ndll/iPhone/libGoogleAdMobAds.a" />
```
2. After creating XCode project, drag libGoogleAdMobAds.a to Project Settings->Build Phases->Link with binaries

**Prerequisites on Android**

1. Copy android-template directory to your project
2. Add following code to your project.xml: 
```xml
<java path="android-template/libs/GoogleAdMobAdsSdk-6.4.1.jar" if="android" />
<template path="android-template/AndroidManifest.xml" rename="AndroidManifest.xml" if="android" />
<template path="android-template/src/org/haxe/lime/GameActivity.java" rename="src/org/haxe/lime/GameActivity.java" if="android" />
'''
