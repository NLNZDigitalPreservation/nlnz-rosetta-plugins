#!/bin/bash
#
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Please remember to copy this file back to /exlibris/dps/nlnz_tools
# and commit back to the subversion repository if changes are made
# these scripts may not be retained after DPS upgrades
# see the readme.txt in the nlnz_tools form more information.
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
#
# Created : Thursday,  01 October 2015  Preeti Badle
#
# Eg: - 
# ffmpeg.exe -i "/export/home/badlepr/ffmpeg_test_files/PM_R12080447-clip.mov" -map 0:v -map 0:a -c:v libx264 -crf 25 -preset slow -deinterlace "/export/home/badlepr/output/AD_R12080447-clip.mp4"

# Test arguments
# -map 0:v -map 0:a -c:v libx264 -crf 25 -preset slow -deinterlace

ARGS=""
# wrap all but the three last parameters in bracket (arguments, input filename and output dir)
for (( i=1;$i<=$#-2;i=$i+1 ))
do
    ARGS="$ARGS ${!i}"
done

echo "ARGS: $ARGS"

# Set INPUT/OUTPUT vars
in_file="${!i}"
let i=i+1
out_file="${!i}"

echo -e "[INFO] Input file: $in_file"
echo -e "[INFO] Output file: $out_file"

CONVERT_CMD=/usr/bin/ebook-convert
echo -e "[INFO] Convert Command: $CONVERT_CMD"


if [ ! -f $in_file ];
then
echo "[ERROR] Input file '$in_file' doesn't exist in the file system"
exit 0
fi

if [ -f $out_file ];
then
echo "[WARN] Output file '$out_file' does exist in the file system, will be replaced"
fi

out_dir="$(dirname "$out_file")"
if [ ! -d $out_dir ];
then
	mkdir $out_dir
	echo "[INFO] Created directory $out_dir"
else
	echo "[INFO] Output directory: $out_dir"
fi


#################################################
# Convert .input_file to .output_file
#################################################

# Conversion begin timestamp
echo -e "[INFO] Conversion start: `date`"

echo -e "[INFO] Converting $in_file to $out_file"
$CONVERT_CMD $ARGS $in_file $out_file

# Conversion end timestamp
echo "[INFO] Conversion end: `date`"
