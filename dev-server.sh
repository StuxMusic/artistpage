#!/bin/bash
# Artistpage - Local dev server
# Usage: ./dev-server.sh [port] [--lan]
#   port            default: 8000
#   --lan           listen on all interfaces so phones/tablets on your network can
#                   connect (prints the addresses to open); default is 127.0.0.1 only
#
# This project is static HTML (no build step, no server-side config), so there's
# no DEV_MODE/production split to toggle - this script just serves the repo root
# over HTTP so the pages can be opened without hand-configuring a static server.
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT=8000
HOST=127.0.0.1
LAN=0

for arg in "$@"; do
    case "$arg" in
        --lan) LAN=1; HOST=0.0.0.0 ;;
        ''|*[!0-9]*) echo "Unknown option: $arg" >&2; echo "Usage: ./dev-server.sh [port] [--lan]" >&2; exit 1 ;;
        *) PORT="$arg" ;;
    esac
done

# This machine's IPv4 addresses (Windows, macOS or Linux), minus loopback.
lan_addrs() {
    case "$OSTYPE" in
        msys*|cygwin*|win32*) ipconfig | awk -F': *' '/IPv4/{print $2}' | tr -d '\r' ;;
        darwin*) ifconfig | awk '/inet /{print $2}' ;;
        *) hostname -I 2>/dev/null | tr ' ' '\n' ;;
    esac | grep -v -e '^127\.' -e '^$' || true
}

print_lan_urls() {
    echo "On your local network (--lan), open one of these on the other device:"
    for a in $(lan_addrs); do echo "    http://$a:$1"; done
    echo "  (usually the 192.168.x.x one; allow PHP (or Python) through the firewall if asked)"
}

echo "Serving $DIR at http://127.0.0.1:$PORT"
[ "$LAN" = "1" ] && print_lan_urls "$PORT"

if command -v php >/dev/null 2>&1; then
    php -S "$HOST:$PORT" -t "$DIR"
elif command -v python3 >/dev/null 2>&1; then
    python3 -m http.server "$PORT" --directory "$DIR" --bind "$HOST"
else
    echo "Neither php nor python3 found on PATH - install one to run a local server." >&2
    exit 1
fi
