#/bin/sh

adb push ./minicap/bin/armeabi-v7a/minicap /data/local/tmp/
adb push ./minicap/shared/android-19/armeabi-v7a/minicap.so  /data/local/tmp/
adb shell "chmod 777 /data/local/tmp/minicap /data/local/tmp/minicap.so"

adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -P 1080x1920@540x960/0
adb forward tcp:1717 localabstract:minicap

