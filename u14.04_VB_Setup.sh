#####
#####   Setup Instructions for this computer
#####

###
###  Settings For VirtualBox
###

Settings > General > Advanced (bidirectional clip board)
Settings > Display (128mb video memory, 3D acceleration)
50GB continuous partition, 4-6GB Ram, 4 Cores

###
###  Essential Stuff
###

sudo apt-get update
sudo apt-get install build-essential checkinstall cmake pkg-config yasm git # Essential stuff

###
### Guest Additions Ubuntu VirtualBox  
### http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
###
sudo apt-get install dkms
sudo apt-get install virtualbox-guest-additions-iso
#Installs here: /usr/share/virtualbox/VBoxGuestAdditions.iso
Open above dir in filemanager
Rightclick mount and run with disk mounter
sudo apt-get install virtualbox-guest-X11  (type Y)


###
### Key Bindings Changes
###

C+A+f (open folder)
C+A+t (open terminal)
C 1,2,3,4 (for_work spaces)
C+A + arrow to navigate
C+A+S + arrow to move windows

###
### Apt-get installs
###
sudo apt-get install gedit-plugins unity-tweaker-tool unrar nautilus-open-terminal

#  Tweaker Tool Adjustments
# Change transparency for Panel and Launcher
# Change workspace count
# Disable online searches

# Emacs prelude
sudo apt-get install emacs24
wget --no-check-certificate https://github.com/bbatsov/prelude/raw/master/utils/installer.sh -O - | sh # Run in home dir

# Python2.7
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install python2.7
sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n # WX For Python
sudo apt-get install python-dev python-libxml2  python-matplotlib python-numpy ipython python-scipy python-tk python-pip ipython-notebook

###
### OpenCV
###

# Update repos so that you can install ffmpeg
sudo add-apt-repository 'deb  http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu trusty main'  && sudo add-apt-repository 'deb  http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu saucy main'  && sudo apt-get update 

# Download OpenCV from here:
http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip/download

# Installed for OpenCV
git clone https://github.com/jayrambhia/Install-OpenCV.git
cd ~/Downloads/Install-OpenCV/Ubuntu
mv openCV tar.gz to above dir

sudo ./opencv_lastest.sh  # May fail but can compile manually

# Manual compile  (can these files be deleted later its 3.2gigs..)
unzip $downloadfile # or tar -xvf $downloadfile
cd opencv-$version
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j 4
sudo make install
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

###
###  Installing ContactAngle
###
apt-get install libhighgui-dev libwxgtk2.8-dev   
git clone git://contactangle.git.sourceforge.net/gitroot/contactangle/contactangle
cmake .
make
sudo make install

###
### Install eclipse (in this case 4.4)
### http://askubuntu.com/questions/26632/how-to-install-eclipse
###

tar -zxvf eclipse.XX.YY.tar.gz  #rename to eclipse44 (44=version)
sudo cp -r eclipse44 /opt
sudo gedit eclipse.desktop

#Paste:
[Desktop Entry]
Name=Eclipse
Type=Application
Exec=eclipse44
Terminal=false
Icon=eclipse
Comment=Integrated Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=Eclipse

sudo desktop-file-install eclipse.desktop
sudo ln -s /opt/eclipse44/eclipse /usr/local/bin/eclipse44
sudo cp /opt/eclipse44/icon.xpm /usr/share/pixmaps/eclipse.xpm

sudo apt-get install default-jre # Install java duh
