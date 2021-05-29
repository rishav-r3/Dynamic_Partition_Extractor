#! /bin/bash Variables
LOCALDIR=$(cd "$(dirname 
"${BASH_SOURCE[0]}")" && pwd) 
outdir="$LOCALDIR/out"
################################################
echo "Making tmp directory" 
   mkdir $LOCALDIR/tmp

echo "Copying Apex files to tmp dir" 
   cd $outdir/system/system/apex 
   cp -v -r -p $outdir/system/system/apex/* $LOCALDIR/tmp

echo "Extracting com.android.adbd.apex" 
   cd $LOCALDIR/tmp && unzip com.android.adbd.apex

echo "Making tmp dir" 
  mkdir $LOCALDIR/tmp/tmp 
  sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp

echo "Making apex folder" 
  mkdir $LOCALDIR/apex

echo "Creating com.android.adbd folder" 
  mkdir $LOCALDIR/apex/com.android.adbd

echo "Copying com.android.adbd.apex" 
  cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.adbd 
  cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.adbd

echo "Unmounting tmp folder" 
  sudo umount $LOCALDIR/tmp/tmp

echo "Removing files extracted from com.android.adbd.apex"
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/apex_pubkey && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && 
   rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/META-INF & rm -rf $LOCALDIR/tmp/apex_manifest.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/com.android.adbd.apex

echo "Unziping com.android.apex.cts.shim.apex"
   cd $LOCALDIR/tmp && unzip com.android.apex.cts.shim.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp

echo "Creating com.android.apex.cts.shim"
   mkdir $LOCALDIR/apex/com.android.apex.cts.shim

echo "Copying com.android.apex.cts.shim.apex"
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.apex.cts.shim
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.apex.cts.shim

echo "Unmounting tmp folder" 
   sudo umount $LOCALDIR/tmp/tmp && rm -rf com.android.apex.cts.shim.apex

echo "Removing files extracted from com.android.apex.cts.shim.apex"
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.apex.cts.shim.apex

echo "Extracting com.android.i18n" 
   cd $LOCALDIR/tmp && unzip com.android.i18n.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp

echo "Making com.android.i18n.apex" 
   mkdir $LOCALDIR/apex/com.android.i18n

echo "Copying com.android.i18n.apex"
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.i18n 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.i18n

echo "Unmounting tmp folder" 
   sudo umount $LOCALDIR/tmp/tmp
   
echo "Extracting com.android.art.release"
   cd $LOCALDIR/tmp && unzip com.android.art.release.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.art.release 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.art.release 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.art.release 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.art.release.apex

echo "Extracting com.android.cellbroadcast"
   cd $LOCALDIR/tmp && unzip com.android.cellbroadcast.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.cellbroadcast 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.cellbroadcast 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.cellbroadcast 
   sudo umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.cellbroadcast.apex

echo "Extracting com.android.conscrypt" 
   cd $LOCALDIR/tmp && unzip com.android.conscrypt.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.conscrypt 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.conscrypt 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.conscrypt 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.conscrypt.apex
   
echo "Extracting com.android.extservices"
   cd $LOCALDIR/tmp && unzip com.android.extservices.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.extservices 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.extservices 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.extservices 
   sudo umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.extservices.apex

echo "Extracting com.android.ipsec"
   cd $LOCALDIR/tmp && unzip com.android.ipsec.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.ipsec 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.ipsec 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.ipsec 
   sudo umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.ipsec.apex

echo "Extracting com.android.media" 
   cd  $LOCALDIR/tmp && unzip com.android.media.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp  
   mkdir $LOCALDIR/apex/com.android.media 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.media 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.media 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.media.apex
   
echo "Extracting com.android.media.swcodec"
   cd $LOCALDIR/tmp && unzip com.android.media.swcodec.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.swcodec 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.swcodec 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.swcodec 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.media.swcodec.apex
   
echo "Extracting com.android.mediaprovider"
   cd $LOCALDIR/tmp && unzip com.android.media.swcodec.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.mediaprovider 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.mediaprovider 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.mediaprovider 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml &&  rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.mediaprovider.apex
   
echo "Extracting com.android.neuralnetworks"
   cd $LOCALDIR/tmp && unzip com.android.neuralnetworks.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.neuralnetworks 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.neuralnetworks 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.neuralnetworks 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.neuralnetworks.apex
   
echo "Extracting com.android.os.statsd" 
   cd $LOCALDIR/tmp && unzip com.android.os.statsd.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.statsd 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.statsd 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.statsd 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.statsd.apex
   
echo "Extracting com.android.permission"
   cd $LOCALDIR/tmp && unzip com.android.permission.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.permission 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.permission 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.permission 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.permission.apex
   
echo "Extracting com.android.resolv"
   cd $LOCALDIR/tmp && unzip com.android.resolv.apex 
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.permission 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.resolv 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.resolv 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.resolv.apex
   
echo "Extracting com.android.runtime" 
   cd $LOCALDIR/tmp && unzip com.android.runtime.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.runtime 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.runtime 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.runtime 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml 
   rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.runtime.apex
 
echo "Extracting com.android.sdkext"
   cd $LOCALDIR/tmp && unzip com.android.sdkext.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.sdkext 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.sdkext 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.sdkext 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.sdkext.apex
   
echo "Extracting com.android.tethering" 
   cd $LOCALDIR/tmp && unzip com.android.tethering.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp 
   mkdir $LOCALDIR/apex/com.android.tethering 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.tethering 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.tethering 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.tethering.apex
   
echo "Extracting com.android.tzdata" 
   cd $LOCALDIR/tmp && unzip com.android.tzdata.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.tzdata 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.tzdata 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.tzdata 
   sudo umount $LOCALDIR/tmp/tmp 
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.tzdata.apex
   
echo "Extracting com.android.vndk.current"
   cd $LOCALDIR/tmp && unzip com.android.vndk.current.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.vndk.current
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.vndk.current
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.vndk.current
   sudo umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.vndk.current.apex
   
echo "Extracting com.android.wifi"
   cd $LOCALDIR/tmp && unzip com.android.wifi.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.wifi 
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.vndk.wifi 
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.wifi sudo 
   umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/Android.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.wifi.apex

echo "Checking if com.android.tethering.inprocess.apex"
   if ( $[[grep "com.android.tethering.inprocess.apex" $LOCALDIR/tmp) ]]; then
   cd $LOCALDIR/tmp && unzip com.android.tethering.inprocess.apex
   sudo mount -o loop,ro,sync apex_payload.img $LOCALDIR/tmp/tmp
   mkdir $LOCALDIR/apex/com.android.inprocess
   cp -v -r -p $LOCALDIR/tmp/tmp/* $LOCALDIR/apex/com.android.tethering.inprocess
   cp -v -r -p $LOCALDIR/tmp/apex_pubkey $LOCALDIR/apex/com.android.tethering.inprocess
   umount $LOCALDIR/tmp/tmp
   rm -rf $LOCALDIR/tmp/apex_payload.img && rm -rf $LOCALDIR/tmp/AndroidManifest.xml && rm -rf $LOCALDIR/tmp/META-INF && rm -rf $LOCALDIR/tmp/apex_build_info.pb && rm -rf $LOCALDIR/tmp/assets && rm -rf $LOCALDIR/tmp/resources.arsc && rm -rf $LOCALDIR/tmp/com.android.tethering.inprocess.apex

echo "Copying apex folder to in system"
   cd $outdir/system/system && rm -rf apex
   cp -v -r -p $LOCALDIR/apex $outdir/system/system

echo "Finished Extracting"
echo "Done"
