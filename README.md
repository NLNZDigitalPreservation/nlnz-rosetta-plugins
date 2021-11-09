<h1 align="center">Plugins for Rosetta</h1>

# Introduction
Rosetta supports two plugin methods:
1) Java Plugin: A Java code plug-in wrapped as a JAR file
2) Script Plugin: An executable shell script plug-in (wrapped in a JAR package). Scripting language should be specified using the Shebang line.

# Plugin of ebook convert: eBookConvertMigrationPlugin
This plugin is to convert quite a lot of ebooks to the epub formats. The plugin will call a command line "ebook-convert", the "ebook-convert" is contained inside the Calibre application.

# Build
mvn clean install

# Deployment
## Prepare the "ebook-convert" command line:
* Download the portable package for CentOS 7 from: https://download.calibre-ebook.com/3.48.0/calibre-3.48.0-x86_64.txz
* Uncompress the package to a specific directory: /exlibris/dps/d4_1/system.dir/thirdparty/calibre-3.48.0-x86_64/

## To deploy the plugin:
* Download the ebook-convert plugin from: https://github.com/NLNZDigitalPreservation/nlnz-rosetta-plugins/releases
* Put the plugin to Rosetta system.



