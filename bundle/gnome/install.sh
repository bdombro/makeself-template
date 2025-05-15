#!/bin/bash

ROOT_DIR="$HOME/.local/share/$APP_SLUG"
SCRIPT_DIR="$ROOT_DIR/bundle/gnome"

echo "***************************************************"
echo "$APP_NAME Gnome Installer"
echo "This installer will install $APP_NAME to your system."
echo "***************************************************"
echo ""

# check if php is installed
if ! command -v php &> /dev/null
then
    echo "PHP is not installed. Please install PHP and try again."
    exit 1
fi


echo "Please read the license agreement before proceeding."
echo ""

cat ./LICENSE

# prompt if agree to the license
echo "Do you agree to the license? (y/n)"
read -r agree
if [[ $agree != "y" ]]; then
    echo "Exiting..."
    bash "$SCRIPT_DIR/uninstall.sh"
    exit 1
fi
echo ""

echo "Installing $APP_NAME..."

cat > ~/.local/share/applications/$APP_SLUG.desktop <<EOF
[Desktop Entry]
Type=Application
Name=$APP_NAME
Exec=$HOME/.local/bin/$APP_SLUG
Icon=$APP_SLUG
Terminal=false
Categories=Utility;
Comment=Start $APP_NAME
EOF

cp "$SCRIPT_DIR/app.png" ~/.local/share/icons/$APP_SLUG.png
ln -s "$ROOT_DIR/app/app.sh" ~/.local/bin/$APP_SLUG
ln -s "$SCRIPT_DIR"/uninstall.sh ~/.local/bin/$APP_SLUG-uninstall
echo "Done!"
echo "You can now run $APP_NAME from the applications menu."