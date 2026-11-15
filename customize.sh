#!/system/bin/sh
[ "$(getprop ro.product.device)" = A67L_Gen2 ] || abort "Fail! This module is for the Foxxd A67L Gen 2."
[ "$KSU" = true ] || abort "Fail! KernelSU Next is required."


RESETPROP=resetprop; command -v resetprop >/dev/null 2>&1 || RESETPROP=/data/adb/ksu/bin/resetprop

ui_print "FM Speaker Enable CyberspaceVII"
ui_print " "
ui_print "\"If you only knew the magnificence of the 3, 6, and 9, then you would have a key to the universe.\" - Nikola Tesla"
ui_print " "

WL=/data/adb/cyberspacevii/fmspeakerenable-a67lg2
mkdir -p "$WL"
echo on > "$WL/fm_state"
"$RESETPROP" persist.sys.support.antenna true 2>/dev/null

if [ "$(getprop persist.sys.support.antenna)" = "true" ]; then
  ui_print "Short-antenna mode enabled."
else
  ui_print "Failed to enable short-antenna mode."
fi

set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/action.sh" 0 0 0755
