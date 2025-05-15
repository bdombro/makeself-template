#!/bin/bash
# sudo apt install makeself
APP_NAME="MyApp"
APP_SLUG="myapp"
APP_DIR="$HOME/.local/share/$APP_SLUG"
APP_INSTALLER="$APP_NAME.gnome.run"
rm -rf *.run
makeself --target "$APP_DIR" . "$APP_INSTALLER" "$APP_NAME Installer" ./install.gnome.sh
chmod +x "$APP_INSTALLER"