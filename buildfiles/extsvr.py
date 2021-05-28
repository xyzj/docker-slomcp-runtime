#!/usr/bin/env python3

SVR_STOP = {
    "ftpupg":"start-stop-daemon --stop -p /run/ftpupg.pid",
    "nboam":"start-stop-daemon --stop -p /run/nboam.pid",
    "back": "start-stop-daemon --stop -p /run/back.pid",
    "asset": "start-stop-daemon --stop -p /run/asset.pid",
    "uas": "start-stop-daemon --stop -p /run/uas.pid",
    "task": "start-stop-daemon --stop -p /run/task.pid",
    "msgpush": "start-stop-daemon --stop -p /run/msgpush.pid",
    "logger": "start-stop-daemon --stop -p /run/logger.pid",
    "ecms": "start-stop-daemon --stop -p /run/ecms.pid",
    "ecms-sh": "start-stop-daemon --stop -p /run/ecms-sh.pid",
    "ecms-cm": "start-stop-daemon --stop -p /run/ecms-cm.pid",
    "gis": "start-stop-daemon --stop -p /run/gis.pid",
    "dm": "start-stop-daemon --stop -p /run/dm.pid",
    "uiact": "start-stop-daemon --stop -p /run/uiact.pid",
    "dpwlst": "start-stop-daemon --stop -p /run/dpwlst.pid",
    "dpnb": "start-stop-daemon --stop -p /run/dpnb.pid",
    "szmqtt": "start-stop-daemon --stop -p /run/szmqtt.pid",
}

SVR_START = {
    "ftpupg":"start-stop-daemon --start --background -d /opt/bin -m -p /run/ftpupg.pid --exec /opt/bin/ftpupgrade -- -conf=ftp.conf -http=6825 -ftp=6826 -portable -forcehttp",
    "nboam":"start-stop-daemon --start --background -d /opt/bin -m -p /run/nboam.pid --exec /opt/bin/nboam -- -conf=nboam.conf -http=6830 -portable -forcehttp",
    "backssh": "start-stop-daemon --start --background -d /opt/bin -m -p /run/back.pid --exec /opt/bin/backend -- -conf=backend.conf -http=6819 -portable",
    "back": "start-stop-daemon --start --background -d /opt/bin -m -p /run/back.pid --exec /opt/bin/backend -- -conf=backend.conf -http=6819 -portable -forcehttp",
    "asset": "start-stop-daemon --start --background -d /opt/bin -m -p /run/asset.pid --exec /opt/bin/assetmanager -- -conf=asset.conf -http=6820 -portable -forcehttp",
    "uas": "start-stop-daemon --start --background -d /opt/bin -m -p /run/uas.pid --exec /opt/bin/uas -- -conf=uas.conf -http=6821 -portable -forcehttp",
    "task": "start-stop-daemon --start --background -d /opt/bin -m -p /run/task.pid --exec /opt/bin/task -- -conf=task.conf -http=6822 -portable -forcehttp",
    "msgpush": "start-stop-daemon --start --background -d /opt/bin -m -p /run/msgpush.pid --exec /opt/bin/msgpush -- -conf=msgpush.conf -http=6823 -portable -forcehttp",
    "logger": "start-stop-daemon --start --background -d /opt/bin -m -p /run/logger.pid --exec /opt/bin/logger -- -conf=logger.conf -http=6824 -portable -forcehttp",
    "ecms": "start-stop-daemon --start --background -d /opt/bin -m -p /run/ecms.pid --exec /opt/bin/ecms-mod -- -conf=ecms.conf -http=6830 -tcp=6831 -portable -forcehttp",
    "ecms-sh": "start-stop-daemon --start --background -d /opt/bin -m -p /run/ecms-sh.pid --exec /opt/bin/ecms-mod -- -conf=ecms-sh.conf -http=6827 -tcp=6828 -tcpmodule=shld -portable -forcehttp",
    "ecms-cm": "start-stop-daemon --start --background -d /opt/bin -m -p /run/ecms-cm.pid --exec /opt/bin/ecms-mod -- -conf=ecms-cm.conf -http=6827 -tcp=6828 -tcpmodule=cmbased -portable -forcehttp",
    "gis": "start-stop-daemon --start --background -d /opt/bin -m -p /run/gis.pid --exec /opt/bin/gismanager -- -conf=gis.conf -http=6829 -portable -forcehttp",
    "dm": "start-stop-daemon --start --background -d /opt/bin/netcore -m -p /run/dm.pid --exec /opt/bin/netcore/datamaintenance -- --conf /opt/bin/conf/datamaintenance --log /opt/bin/log/datamaintenance",
    "uiact": "start-stop-daemon --start --background -d /opt/bin/netcore -m -p /run/uiact.pid --exec /opt/bin/netcore/userinteraction -- --conf /opt/bin/conf/userinteraction --log /opt/bin/log/userinteraction",
    "dpwlst": "start-stop-daemon --start --background -d /opt/bin/netcore -m -p /run/dpwlst.pid --exec /opt/bin/netcore/dataparser-wlst -- --conf /opt/bin/conf/dataparser-wlst --log /opt/bin/log/dataparser-wlst",
    "dpnb":"start-stop-daemon --start --background -d /opt/bin/netcore -m -p /run/dpnb.pid --exec /opt/bin/netcore/dataparser-nbiot -- --conf /opt/bin/conf/dataparser-nbiot --log /opt/bin/log/dataparser-nbiot",
    "szmqtt":"start-stop-daemon --start --background -d /opt/bin/netcore -m -p /run/szmqtt.pid --exec /opt/bin/netcore/mqttmiddlewareforsz -- --conf /opt/bin/conf/mqttmiddlewareforsz --log /opt/bin/log/mqttmiddlewareforsz"
}

if __name__ == "__main__":
    i = 0
    keys = SVR_START.keys()
    for a in keys:
        print("[ "+a+" ]: "+SVR_START[a]+"\n")

