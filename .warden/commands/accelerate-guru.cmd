#!/usr/bin/env bash
# warden accelerate-guru {start|stop|restart|logs|status|pull}
set -euo pipefail

ACTION="${1:-help}"

case "${ACTION}" in
  start)
    warden env up -d dragonfly accelerate-guru
    ;;
  stop)
    warden env stop accelerate-guru dragonfly
    ;;
  restart)
    warden env restart accelerate-guru
    echo "Config reloaded. DragonflyDB kept running."
    ;;
  logs)
    warden env logs --tail=200 -f accelerate-guru
    ;;
  status)
    warden env ps accelerate-guru dragonfly
    ;;
  pull)
    warden env pull accelerate-guru
    warden env up -d accelerate-guru
    echo "Updated to latest image."
    ;;
  *)
    echo "Usage: warden accelerate-guru {start|stop|restart|logs|status|pull}"
    ;;
esac
