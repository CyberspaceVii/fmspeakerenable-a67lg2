#!/system/bin/sh
WL=/data/adb/cyberspacevii/fmspeakerenable-a67lg2
RESETPROP=resetprop; command -v resetprop >/dev/null 2>&1 || RESETPROP=/data/adb/ksu/bin/resetprop
if [ "$(cat "$WL/fm_state" 2>/dev/null)" = "off" ]; then
  "$RESETPROP" persist.sys.support.antenna false
else
  "$RESETPROP" persist.sys.support.antenna true
fi
