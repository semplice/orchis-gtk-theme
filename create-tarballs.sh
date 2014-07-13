#!/bin/bash

echo "Orchis GTK Theme archive creation script."

# Enter working directory
cd $HOME/checkout/orchis-gtk-theme

# Create Zip archive
echo "Creating zip archive..."
if [ -e orchis-gtk-theme.zip ];then
	rm orchis-gtk-theme.zip
fi
zip -qr orchis-gtk-theme.zip Orchis Orchis-Dark AUTHORS UNINSTALL INSTALL LICENSE
cp -r orchis-gtk-theme.zip $HOME/www/mokaproject/source/packages/zip/
echo "Done."

# Create Arch Tarball
echo "Creating AUR tarball..."
if [ -e orchis-gtk-theme.tar.gz ];then
	rm orchis-gtk-theme.tar.gz
fi
mkdir orchis-gtk-theme
chmod 755 PKGBUILD
cp -r PKGBUILD ./orchis-gtk-theme
chmod 755 orchis-gtk-theme
tar -czf orchis-gtk-theme.tar.gz orchis-gtk-theme
rm -r orchis-gtk-theme
echo "Done."

# Create RPM Tarball
echo "Creating RPM source tarball..."
if [ -e orchis-gtk-theme-3.0.tar.gz ];then
	rm orchis-gtk-theme-3.0.tar.gz
fi
mkdir orchis-gtk-theme-3.0
cp -r Orchis Orchis-Dark AUTHORS LICENSE ./orchis-gtk-theme-3.0
tar -czf orchis-gtk-theme-3.0.tar.gz orchis-gtk-theme-3.0
cp -r orchis-gtk-theme-3.0.tar.gz $HOME/rpmbuild/SOURCES/
rm -r orchis-gtk-theme-3.0
echo "Done."

# Create DEB Tarball
echo "Creating DEB source tarball..."
if [ -e orchis-gtk-theme-3.0_DEB.tar.gz ];then
	rm orchis-gtk-theme-3.0_DEB.tar.gz
fi
mkdir orchis-gtk-theme-3.0_DEB
cp -r Orchis Orchis-Dark debian AUTHORS LICENSE ./orchis-gtk-theme-3.0_DEB
tar -czf orchis-gtk-theme-3.0_DEB.tar.gz orchis-gtk-theme-3.0_DEB
rm -r orchis-gtk-theme-3.0_DEB
echo "Done."