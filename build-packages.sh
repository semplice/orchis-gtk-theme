#!/bin/bash

echo "Orchis GTK Theme build script."

# Enter working directory
cd $HOME/checkout/orchis-gtk-theme

if [ -e $HOME/rpmbuild/RPMS/noarch/orchis-gtk-theme-*.rpm ]; then
	rm $HOME/rpmbuild/RPMS/noarch/orchis-gtk-theme-*.rpm
fi

# Create RPM Source Tarball
echo "Building RPM..."
rpmbuild -v -ba --sign orchis-gtk-theme.spec
echo "Done."

echo "Deleting obsolete RPM..."
rm $HOME/www/mokaproject/source/packages/rpm/noarch/orchis-gtk-theme-*.noarch.rpm
echo "Done."
echo "Moving built RPM for deployment..."
cp -r $HOME/rpmbuild/RPMS/noarch/orchis-gtk-theme-*.noarch.rpm $HOME/www/mokaproject/source/packages/rpm/noarch
echo "Done."

# Update repository metadata
echo "Updating repository metadata..."
createrepo -v --update /home/sam/www/mokaproject/source/packages/rpm/
echo "Done."

echo "Preparing for deployment..."
cd $HOME/www/mokaproject/ && middleman build
echo "Done."

# Re-enter working directory
cd $HOME/checkout/orchis-gtk-theme
