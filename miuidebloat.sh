#! /bin/bash

#Variables
LOCALDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
outdir="$LOCALDIR/out"
##############################################
echo "Debloating......"
echo "Removing Email"
rm -rf $outdir/system/system/app/Email
echo "Removing Updater"
rm -rf $outdir/system/system/app/Updater
echo "Removing MiDrive"
rm -rf $outdir/system/system/app/MiDrive
echo "Removing MiuiBugReport"
rm -rf $outdir/system/system/app/MiuiBugReport
echo "Removing MiuiCompass"
rm -rf $outdir/system/system/app/MiuiCompass
echo "Removing MiuiVideoGlobal"
rm -rf $outdir/system/system/app/MiuiVideoGlobal
echo "Removing NextPay"
rm -rf $outdir/system/system/app/NextPay
echo "Switching to priv-app"
echo "Removing Calendar"
rm -rf $outdir/system/system/priv-app/Calendar
echo "Removing MiMover"
rm -rf $outdir/system/system/priv-app/MiMover
echo "Removing MiBroswerGlobal"
rm -rf $outdir/system/system/priv-app/MiBrowserGlobal
echo "Removing MiRecycle"
rm -rf $outdir/system/system/priv-app/MiRecycle
echo "Removing MiuiScanner"
rm -rf $outdir/system/system/priv-app/MiuiScanner
echo "Removing Tag"
rm -rf $outdir/system/system/priv-app/Tag
echo "Removing Weather"
rm -rf $outdir/system/system/priv-app/Weather
echo "Switching to product/priv-app"
echo "Removing Velvet"
rm -rf $outdir/system/system/product/priv-app/Velvet
echo "Finished Debloating"
