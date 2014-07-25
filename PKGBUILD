pkgname=orchis-gtk-git
_pkgname=orchis-gtk-theme
pkgver=3.0
pkgrel=2
pkgdesc="Orchis is a modern GTK3 theme for Linux."
arch=('any')
url="https://github.com/moka-project/orchis-gtk-theme"
license=('GPL3')
makedepends=('git')
optdepends=()
provides=('orchis-gtk-git')
conflicts=('orchis-gtk-git')
source=('git+https://github.com/moka-project/orchis-gtk-theme.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Orchis

  # install theme
  cd $srcdir/orchis-gtk-theme/Orchis
  cp -r . "$pkgdir"/usr/share/themes/Orchis/
}
