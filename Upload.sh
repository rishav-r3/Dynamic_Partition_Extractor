echo "This will zip and upload"
  curl -sL https://git.io/file-transfer | sh
  sudo chmod -R 777 MountedImage
  touch links.txt
  echo "MountedImage link : " >> links.txt
  gzip -v MountedImage/system.img
  ./transfer trs MountedImage/system.img.gz | grep Download >> links.txt 
  cat links.txt
exit 1
