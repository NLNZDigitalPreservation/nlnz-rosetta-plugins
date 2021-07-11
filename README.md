<h1 align="center">Plugins for Rosetta</h1>

# Introduction
Rosetta supports two plugin methods:
1) Java Plugin: A Java code plug-in wrapped as a JAR file
2) Script Plugin: An executable shell script plug-in (wrapped in a JAR package). Scripting language should be specified using the Shebang line.

# Plugin of ebook convert: eBookConvertMigrationPlugin
This plugin is to convert quite a lot of ebooks to the epub formats. The plugin will call a command line "ebook-convert", the "ebook-convert" is contained inside the Calibre application.

## For development
### To Build the plugin 
Usage: mvn clean install
### To build the library "libstdc++.so.6.0.27"
1) To check does CXXABI_1.3.8 include inside the lib libstdc++.so.6 with the command: strings /usr/lib64/libstdc++.so.6 | grep CXXABI
2) If CXXABI_1.3.8 does not exist inside the lib libstdc++.so.6, then we must compile GCC to the a new libary with the command:
* sudo yum install gmp-devel mpfr-devel libmpc-devel -y
* cd download
* wget ftp://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.xz
* xz -d gcc-9.2.0.tar.xz
* tar -xf gcc-9.2.0.tar
* cd gcc-9.2.0
* ./configure --disable-multilib --enable-languages=c,c++ --prefix=$HOME/local
* make -j install


## To deploy the plugin
1) Prepare the "ebook-convert" command line:
* Download the portable package from: https://download.calibre-ebook.com/5.23.0/calibre-5.23.0-x86_64.txz
* Uncompress the package to a specific directory
* Create a link to the ebook-convert with the command: sudo ln -s <directory>/ebook-convert ebook-convert

2) To upgrade the dependency libary
Check does the libary "libstdc++.so.6.0.27" exist in /lib64 directory.
* If it does not exist, put the libary "libstdc++.so.6.0.27" into the directory /lib64, and make a link to the library with the command line: sudo ln -s libstdc++.so.6.0.27 libstdc++.so.6
* If it does exist, then ignore this step.



