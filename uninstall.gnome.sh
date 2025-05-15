#!/bin/bash

echo "***************************************************"
echo "MyApp Uninstaller"
echo "This installer will uninstall MyApp to your system."
echo "***************************************************"
echo ""
echo "Uninstalling MyApp..."
rm -rf ~/.local/share/myapp
rm ~/.local/share/applications/myapp.desktop
rm ~/.local/share/icons/myapp.png
rm ~/.local/bin/myapp
rm ~/.local/bin/myapp-uninstall
echo "Done!"
