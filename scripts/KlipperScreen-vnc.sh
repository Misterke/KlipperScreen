#!/bin/bash

SCRIPTPATH=$(dirname $(realpath $0))
if [ -f $SCRIPTPATH/launch_KlipperScreen.sh ]
then
echo "Running "$SCRIPTPATH"/launch_KlipperScreen.sh"
$SCRIPTPATH/launch_KlipperScreen.sh
exit $?
fi

echo "Running KlipperScreen on X in display :0 by default"
#/usr/bin/xinit $KS_XCLIENT
vncserver -clear -kill :0
vncserver -alwaysshared :0
export DISPLAY=:0.0
while true; do
  $KS_XCLIENT
done
