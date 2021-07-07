# install.bash - full installation of dependencies
#
# DEPRECIATED SCRIPT

# python pip

apt-get install python-pip
pip install --upgrade youtube-dl

# vorbis-tools

apt-get install vorbis-tools

# lltag

apt-get install lltag

# mov retspan to /bin

DIR=$(pwd)

cp -v "${DIR}/bin/retspan" "/bin"
chmod +x "/bin/retspan"

echo "Installation Complete!"
