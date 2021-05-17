#! /bin/bash

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/out"
###########################################

echo "Repacking system folder to system.img"
   cd $outdir/ && mkdir out
   cd $outdir/out/ && mkdir system
   dd if=/dev/zero of=$outdir/out/system.img bs=3k count=986734
   mkfs.ext4 $outdir/out/system.img
   tune2fs -c0 -i0 $outdir/out/system.img

echo "Mounting System.img"
   mount -o rw $outdir/out/system.img $outdir/out/system

echo "Copying Contents of system folder to mounted system.img"
   cp -v -r -p * $outdir/system/* $outdir/out/system/ &> /dev/null
   sync

echo "Unmounting System.img"
   umount $outdir/out/system

echo "Copying System.img"
   cp -v -r -p $outdir/out/system.img $outdir/

echo "Performing Cleanup"
   rm -rf $outdir/system
   rm -rf $outdir/out

echo "Done Repacking"
echo "Repacked System Image is in /out folder"   
