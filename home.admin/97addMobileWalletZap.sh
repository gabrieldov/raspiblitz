#!/bin/bash

# load raspiblitz config data (with backup from old config)
source /mnt/hdd/raspiblitz.conf 2>/dev/null
if [ ${#network} -eq 0 ]; then network=`cat .network`; fi
if [ ${#chain} -eq 0 ]; then
  chain=$(${network}-cli getblockchaininfo | jq -r '.chain')
fi

# make sure qrcode-encoder in installed
clear
echo "*** Setup ***"
echo ""
echo "Installing zapconnect. Please wait..."
echo ""
echo "Getting github.com/LN-Zap/zapconnect ..."
go get -d github.com/LN-Zap/zapconnect
echo ""
echo "Building github.com/LN-Zap/zapconnect ..."
cd /home/admin/go/src/github.com/LN-Zap/zapconnect/
go build -o /home/admin/go/src/github.com/LN-Zap/zapconnect/zapconnect


clear
echo "******************************"
echo "Connect Zap Mobile Wallet"
echo "******************************"
echo ""
echo "GETTING THE APP"
echo "At the moment this app is in closed beta testing and the source code has not been published yet."
echo "Go to http://www.zap-ios.jackmallers.com sign up with your email (confirmation can take time)"
echo "iOS: Read https://developer.apple.com/testflight/testers/"
echo ""
echo "*** STEP 1 ***"
echo "Once you have the app is running make sure you are on the same local network (WLAN same as LAN)."
echo ""
echo "Click on Connect remote node"
echo "Make the this terminal as big as possible - fullscreen would be best."
echo "Then PRESS ENTER here in the terminal to generare the QR code and scan it with the app."
read key

clear
echo "*** STEP 2 : Click on Scan (make whole QR code fill camera) ***"

# If you drop the -i parameter, zapconnect will use the external IP. 
/home/admin/go/src/github.com/LN-Zap/zapconnect/zapconnect -i

echo "(To shrink QR code: OSX->CMD- / LINUX-> CTRL-) Press ENTER when finished."
read key

clear
echo "If its not working - check issues on GitHub:"
echo "https://github.com/LN-Zap/zap-iOS/issues"
echo "https://github.com/LN-Zap/zapconnect/issues"
echo ""
