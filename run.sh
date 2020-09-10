#/bin/sh

adb push ./node_modules/minicap-prebuilt/prebuilt/armeabi-v7a/bin/minicap /data/local/tmp/
adb push ./node_modules/minicap-prebuilt/prebuilt/armeabi-v7a/lib/android-19/minicap.so  /data/local/tmp/
adb shell "chmod 777 /data/local/tmp/minicap /data/local/tmp/minicap.so"

adb push ./node_modules/minitouch-prebuilt/prebuilt/armeabi-v7a/bin/minitouch /data/local/tmp/
adb shell "chmod 777 /data/local/tmp/minitouch"

adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -P 1080x1920@540x960/0
adb forward tcp:1717 localabstract:minicap

adb shell /data/local/tmp/minitouch
adb forward tcp:1111 localabstract:minitouch
