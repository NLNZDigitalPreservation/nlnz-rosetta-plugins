#!/bin/bash


in_dir="/media/sf_VM_SHARED/ebook-convert/Epub"
out_dir="/media/sf_VM_SHARED/ebook-convert/output"


for fname in "$in_dir"/*
do
  echo ""
  echo "#############ebook convert $fname, output to $out_dir###############"
  ../../main/bin/eBookConvert.sh "$fname" "$out_dir"
done