#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
ROOT_DIR="$SCRIPT_DIR/../../"

APP_INSTALL_DIR="$HOME/.local/share/$APP_SLUG"
APP_INSTALLER="$SCRIPT_DIR/install.run"

if ! command -v makeself &> /dev/null
then
    echo "makeself could not be found, please install it first via apt install makeself."
    exit 1
fi


rm -f install.app
makeself --target "$APP_INSTALL_DIR" "$ROOT_DIR" "$APP_INSTALLER" "$APP_NAME Installer" "$SCRIPT_DIR/install.sh"
chmod +x "$APP_INSTALLER"