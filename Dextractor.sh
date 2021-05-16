#! /bin/bash

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/out"
echo "This tool support upto 4gb system partition"
########################################################

echo "Extracting ROM zip file....."
   bash $LOCALDIR/extractor.sh $1
echo "Mounting Partitions"
   mkdir $outdir/ system && mkdir $outdir/ system_ext && mkdir $outdir/product && rm -rf boot.img && rm -rf tz.img && rm -rf dtbo.img && rm -rf modem.img && rm -rf vendvendor.img					
   mount -o loop $outdir/system.img $outdir/system && mount -o loop $outdir/system_ext.img $outdir/system_ext &&  mount -o loop $outdir/ product.img $outdir/product
echo "Creating System Folder"
    mkdir $LOCALDIR/out/out/system 
echo "Merging Partitions"
    cp -v -r -p $outdir/system/* $outdir/out/system/ &> /dev/null
    sync 
echo "Merging Product"
    cd $outdir/out/system/ && rm -rf product 
    cd $outdir/out/system/system/ && rm -rf product && mkdir product
    cp -v -r -p $outdir/product/* $outdir/out/system/system/product/ &> /dev/null
    sync 
echo "Merging System_ext"
    cd $outdir/out/system/ && rm -rf system_ext
    cd $outdir/out/system/system/ && rm -rf system_ext && mkdir system_ext
    cp -v -r -p $outdir/system_ext/* $outdir/out/system/system/system_ext/ &> /dev/null
    sync 
echo  "Linking Product"
    cd $outdir/out/system/system/ && ln -sf /system/product $outdir/out/system/
echo "Linking System_ext"
    cd $outdir/out/system/system/ && ln -sf /system/system_ext $outdir/out/system
echo "Unmounting System partition"
    umount $outdir/system
echo "Unmounting Product Partition"
    umount $outdir/product
echo "Unmounting System_ext partition"
    umount $outdir/system_ext
echo "Performing Cleanup"
    rm -rf $outdir/system.img && rm -rf $outdir/system && rm -rf $outdir/system_ext && rm -rf $outdir/system_ext.img && rm -rf $outdir/product && rm -rf $outdir/product.img
echo "Moving  Merged system folder"
    cp -v -r -p $outdir/out/system $outdir/
echo "Finalising..."
    rm -rf $outdir/out/
echo "Partitions has been merged successfully"   
