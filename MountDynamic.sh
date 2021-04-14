#!/bin/bash

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/out"
echo "It support upto 5gb of system partition"
#############################################################

echo "Extracting Required Partitions . . . . "
	echo "Unpacking Firmware"
	bash $LOCALDIR/extractor.sh $1
	mv $LOCALDIR/out/system.img $LOCALDIR/out/system-old.img

echo "Creating Dummy System Image . . . . "
    dd if=/dev/zero of=$LOCALDIR/out/system-new.img bs=5k count=1048576
    mkfs.ext4 $LOCALDIR/out/system-new.img
    tune2fs -c0 -i0 $LOCALDIR/out/system-new.img

echo "Mounting System Images . . . . "
	mkdir $outdir/system
	mkdir $outdir/system-old
	mount -o loop $outdir/system-new.img $outdir/system/
	mount -o ro $outdir/system-old.img $outdir/system-old/
	echo "Mounted System succesfully"

echo "Copying Files . . . . "
	cp -v -r -p $outdir/system-old/* $outdir/system/ &> /dev/null
	sync
	umount -l $outdir/system-old
	rm -rf $outdir/system-old/
	rm $outdir/system-old.img

echo "Merging product.img"
	mkdir $outdir/product
	mount -o ro $outdir/product.img $outdir/product/
	rm -rf $outdir/system/product
	mkdir $outdir/system/product
	cp -v -r -p $outdir/product/* $outdir/system/product/ &> /dev/null
	sync
	umount $outdir/product
	rmdir $outdir/product/
	rm $outdir/product.img

echo "Merging system_ext.img"
	mkdir $outdir/system_ext
	rm -rf $outdir/system/system_ext
	mkdir $outdir/system/system_ext
	mount -o ro $outdir/system_ext.img $outdir/system_ext/
	cp -v -r -p $outdir/system_ext/* $outdir/system/system_ext/ &> /dev/null
	sync
	umount $outdir/system_ext
	rmdir $outdir/system_ext/
	rm $outdir/system_ext.img

echo "Finalising "
    umount $outdir/system
    rm -rf $outdir/system
    mkdir $LOCALDIR/MountedImage
    mv $outdir/system-new.img $LOCALDIR/MountedImage/system.img
    rm -rf $LOCALDIR/out

echo "Congrats all Partition mounted"
echo "Remember to debloat your self"
