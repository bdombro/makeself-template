#!/bin/bash

echo "***************************************************"
echo "MyApp Installer"
echo "This installer will install MyApp to your system."
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
    rm -rf ./
    exit 1
fi
echo ""
echo "Installing MyApp..."
# copy the current directory to the standard non-root user directory for applications
# cp -r ./ ~/.local/share/myapp
cp ./myapp.desktop ~/.local/share/applications/
cp ./myapp.png ~/.local/share/icons/
ln -s `pwd`/myapp.sh ~/.local/bin/myapp
ln -s `pwd`/uninstall.gnome.sh ~/.local/bin/myapp-uninstall
echo "Done!"
echo "You can now run MyApp from the applications menu."