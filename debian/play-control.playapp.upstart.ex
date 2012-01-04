# Starts one Play application

description     "Starts a Play application"
author          "Francisco José Canedo Dominguez <paco+debian@lunatech.com>"
version         "0.1"

stop on stopping play-control

instance $APP

respawn
respawn limit 10 5
umask 022
# expect fork

pre-start script
        . /etc/default/play-control
	cd $PLAY_APPS_DIR
        rm ${APP}/server.pid || true
end script

post-stop script
        . /etc/default/play-control
        su - $USER -c "cd $PLAY_APPS_DIR; $PLAY stop $APP"
        rm ${APP}/server.pid || true
end script

script
        . /etc/default/play-control
        su - $USER -c "cd $PLAY_APPS_DIR; $PLAY start $APP"
end script
