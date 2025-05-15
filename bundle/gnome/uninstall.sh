#!/bin/bash

echo "Uninstalling $APP_NAME..."
rm -rf ~/.local/share/$APP_SLUG
rm ~/.local/share/applications/$APP_SLUG.desktop
rm ~/.local/share/icons/$APP_SLUG.png
rm ~/.local/bin/$APP_SLUG
rm ~/.local/bin/$APP_SLUG-uninstall
echo "Done!"
