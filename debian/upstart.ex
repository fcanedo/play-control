# Starts all Play applications installed in the Play apps dir

description "Starts all Play applications"
author "Francisco José Canedo Dominguez"
version "0.1"

start on runlevel [2345]
stop on runlevel [016]

pre-start script
	. /etc/default/play-control
        test -x $PLAY || { stop; exit 0; }
	for APP in `ls $PLAY_APPS_DIR`
	do
		start playapp APP=$APP
	done
end script
