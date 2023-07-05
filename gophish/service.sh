#!/bin/bash

# Path of Gophish::::
GOPHISH_DIR="/path/gophish"

# Port of Gophish::::::
GOPHISH_PORT=3333

# Path of Gophish LOG:::
LOG_FILE="/path/gophish.log"

# Start Gophish:::
start_gophish() {
    cd "$GOPHISH_DIR"
    nohup ./gophish > "$LOG_FILE" 2>&1 &
    echo "Gophish başlatildi."
}

# Stop Gophish::::
stop_gophish() {
    pid=$(pgrep -f gophish)
    if [[ -n $pid ]]; then
        kill "$pid"
        echo "Gophish durduruldu."
    else
        echo "Gophish zaten durdurulmuş durumda."
    fi
}

# Check Gophish:::
check_gophish_status() {
    pid=$(pgrep -f gophish)
    if [[ -n $pid ]]; then
        echo "Gophish çalişiyor."
    else
        echo "Gophish durdu."
    fi
}

# Usage Commands:::
case "$1" in
    start)
        start_gophish
        ;;
    stop)
        stop_gophish
        ;;
    restart)
        stop_gophish
        sleep 2
        start_gophish
        ;;
    status)
        check_gophish_status
        ;;
    *)
        echo "Kullanim: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

exit 0
