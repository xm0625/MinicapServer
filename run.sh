#!/bin/sh
cpu_arch=`adb shell getprop ro.product.cpu.abi`
api_ver_num=`adb shell getprop ro.build.version.sdk`
adb push ./node_modules/minicap-prebuilt/prebuilt/$cpu_arch/bin/minicap /data/local/tmp/
adb push ./node_modules/minicap-prebuilt/prebuilt/$cpu_arch/lib/android-$api_ver_num/minicap.so  /data/local/tmp/
adb push ./node_modules/minitouch-prebuilt/prebuilt/$cpu_arch/bin/minitouch /data/local/tmp/



width_px=`adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -i | grep width | awk -F ': ' '{print $2}' | awk -F ',' '{print $1}'`
height_px=`adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -i | grep height | awk -F ': ' '{print $2}' | awk -F ',' '{print $1}'`
r_width=`expr $width_px / 2`
r_height=`expr height_px / 2`
adb shell ps | grep minicap >/dev/null 2>&1
[ $? -eq 1 ] && nohup adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/minicap -P $width_pxx$height_px@$r_widthx$r_height/0 -Q 30 -S >/dev/null 2>&1 &

adb shell ps | grep minitouch >/dev/null 2>&1
[ $? -eq 1 ] && nohup adb shell /data/local/tmp/minitouch >/dev/null 2>&1 &

netstat -apn | grep 1717 | grep adb >/dev/null 2>&1
[ $? -eq 1 ] && adb forward tcp:1717 localabstract:minicap

netstat -apn | grep 1111 | grep adb >/dev/null 2>&1
[ $? -eq 1 ] && adb forward tcp:1111 localabstract:minitouch

ps -ef | grep node | grep app >/dev/null 2>&1
[ $? -eq 1 ] && nohup  node app.js  >/dev/null 2>&1 &

# adb shell svc power stayon true && adb shell input keyevent 26

