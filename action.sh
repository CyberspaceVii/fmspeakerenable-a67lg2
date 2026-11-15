#!/system/bin/sh
WL=/data/adb/cyberspacevii/fmspeakerenable-a67lg2
RESETPROP=resetprop; command -v resetprop >/dev/null 2>&1 || RESETPROP=/data/adb/ksu/bin/resetprop
if [ "$(cat "$WL/fm_state" 2>/dev/null)" = "off" ]; then
  echo on > "$WL/fm_state"
  "$RESETPROP" persist.sys.support.antenna true
  echo "FM speaker mode enabled; headphones are not required."
else
  echo off > "$WL/fm_state"
  "$RESETPROP" persist.sys.support.antenna false
  echo "FM speaker mode disabled; headphones are required again."
fi
am force-stop com.android.fmradio 2>/dev/null
echo "(reopen the FM Radio app for the change to take effect)"
