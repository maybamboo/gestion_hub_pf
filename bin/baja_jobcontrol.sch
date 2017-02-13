ps x | grep srvJobCtrl | grep -v grep | awk '{print $1}' | xargs -n 1 --verbose kill -9
