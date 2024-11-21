set -e

VERSION=$1
echo "installing gcc-$VERSION"
sudo apt-get remove -y gcc-$VERSION g++-$VERSION
sudo apt-get install -y gcc-$VERSION g++-$VERSION

gcc-$VERSION --version
