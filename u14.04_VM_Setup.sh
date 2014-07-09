#####
#####   Setup Instructions for this computer
#####

###
### Key Bindings Changes
###

ctrl+alt+f (open folder)
ctrl 1,2,3,4 (for_work spaces)

###
### Setting up custom monitor resolution
###

cvt 1920 1080 60
# Output:
# # 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
# Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
sudo xrandr --newmode "1920x1080_60.00" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
sudo xrandr --addmode Virtual1 "1920x1080_60.00"
xrandr --output Virtual1 --mode 1920x1080_60.00

###
### Apt-get installs
###

sudo apt-get update
sudo apt-get install build-essential checkinstall cmake pkg-config yasm git # Essential stuff
sudo apt-get install gedit-plugins gnome-tweaker-tool compizconfig-settings-manager
# Change font sizes to 16+ in tweaker tool
# Enable multiple grid sizes in grid section

# Emacs prelude
sudo apt-get install emacs24
wget --no-check-certificate https://github.com/bbatsov/prelude/raw/master/utils/installer.sh -O - | sh # Run in home dir

# Remove menubar
sudo apt-get autoremove appmenu-gtk appmenu-gtk3 appmenu-qt appmenu-qt5 indicator-appmenu
https://ubuntuforums.org/showthread.php?t=2182900

# Disable online searches from dash (make dash faster)
wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash

# Python2.7
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
sudo apt-get install python2.7
sudo apt-get install python-wxgtk2.8 python-wxtools wx2.8-i18n # For Python
sudo apt-get install python-dev python-libxml2  python-matplotlib python-numpy
sudo apt-get install ipython python-scipy python-tk python-pip ipython-notebook

# OpenCV .... Doesn't seem to work?
sudo apt-get install libopencv-dev
sudo apt-get install libtiff4-dev libjpeg-dev libjasper-dev # Image IO
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev # Video IO
sudo apt-get install libwxgtk2.8-dev libwxgtk2.8-dbg # Wx Widgets For C/CPP
sudo ln -sv /usr/include/wx-2.8/wx /usr/include/wx # Link so your compiler can find this stuff
# Add to end of g++ commadn `wx-config --cxxflags` `wx-config --libs`

# Build OpenCV from source and install ffmpeg
# http://opencv.org/downloads.html
# https://help.ubuntu.com/community/OpenCV
sudo apt-get -qq remove ffmpeg x264 libx264-dev
sudo apt-get -qq install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils
# Install ffmpeg	https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
sudo apt-get install libass libfdk-aac-dev libopus-dev libvpx-dev libx264-dev
PATH="$PATH:$HOME/bin" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --bindir="$HOME/bin" \
  --extra-libs="-ldl" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree \
  --enable-x11grab
PATH="$PATH:$HOME/bin" make
make install
make distclean
hash -r
# Unzip and change to opencv-$version
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j2
sudo checkinstall
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

###
### Install eclipse (in this case 4.4)
### http://askubuntu.com/questions/26632/how-to-install-eclipse
###

tar -zxvf eclipse.XX.YY.tar.gz
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
sudo cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm

#This command failed because org.eclipse.osgi does not exist for this install
sudo chown -R $USER:$USER /opt/eclipse/configuration/org.eclipse.osgi
