#!/bin/bash

#Variables

PARTITIONS=("system" "product" "system_ext")
payload_extractor="tools/update_payload_extractor/extract.py"
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#outdir="$LOCALDIR"
outdir="$LOCALDIR/out"
echo "It support upto 5gb of system partition"
#############################################################

usage() {
    echo "Usage: $0 <Firmware Type> [Path to Firmware]"
    echo -e "\tCurrently It can only mount product and system_ext"
    echo -e "\tFirmware Type! = Currently only Generic supported"
    echo -e "\tPath to Firmware!"
}

if [ "$1" == "" ]; then
    echo "Enter all needed parameters"
    usage
    exit 1
fi


echo "Extracting Required Partitions . . . . "
if [ $1 = "Generic" ]; then
	    echo "Unpacking Firmware"
        bash $LOCALDIR/extractor.sh $2
        fi
        mv $outdir/system.img $outdir/system-old.img
echo "Creating Dummy System Image . . . . "
dd if=/dev/zero of=$outdir/system.img bs=5k count=1048576
mkfs.ext4 $outdir/system.img
tune2fs -c0 -i0 $outdir/system.img
echo "Mounting System Images . . . . "
	mkdir $outdir/system
	mkdir $outdir/system-old
	mount -o loop $outdir/system.img system/
	mount -o ro $outdir/system-old.img system-old/
	echo "  Mounted System succesfully "
echo "Copying Files . . . . "
	cp -v -r -p $outdir/system-old/* $outdir/system/ &> /dev/null
	sync
	umount $outdir/system-old
  rm -rf $outdir/system-old/
	rm $outdir/system-old.img
echo "Merging product.img "
	mkdir $outdir/product
	mount -o ro $outdir/product.img $outdir/product/
	cp -v -r -p $outdir/product/* system/product/ &> /dev/null
	sync
	umount $outdir/product
	rmdir $outdir/product/
	rm $outdir/product.img
echo "Merging system_ext.img "
	mkdir $outdir/system_ext
	mount -o ro $outdir/system_ext.img $outdir/system_ext/
	cp -v -r -p $outdir/system_ext/* $outdir/system/system_ext/ &> /dev/null
	sync
	umount $outdir/system_ext
	rmdir $outdir/system_ext/
	rm $outdir/system_ext.img
fi
echo "Finalising "
  umount $outdir/system
  rm -rf $outdir/system
echo "Congrats all Partition mounted"
echo "Remember to debloat your self"
