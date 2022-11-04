#!/bin/bash

echo -e "\e[1;32m"
echo "___________                  .__         __________ ___________________"
echo "\_   _____/ ____  ____  _____|__|____    \______   \\\\_____  \__    ___/"
echo " |    __)__/ ___\/  _ \/  ___/  \__  \    |    |  _/ /   |   \|    |   "
echo " |        \  \__(  <_> )___ \|  |/ __ \_  |    |   \/    |    \    |   "
echo "/_______  /\___  >____/____  >__(____  /  |______  /\_______  /____|   "
echo -e "  \e[1;33mv1.0\e[1;32m  \/     \/          \/        \/          \/         \/         "
echo -e "\e[0m"

cookies=$(cat ./cookie.txt)
kword=$RANDOM

echa=""
for i in $(echo $cookies | tr ";" "\n")
do
  if [[ $i == "ECHA="* ]] ; then
      echa=${i/ECHA=/$""}
  fi
done

echo -e "\e[1;32m[+] [INFO] \e[0mToken: "$echa" from \e[0;35mcookie.txt\e[0m"

echo -e ""

while true
do
    echo -e "\e[1;34m[*] \e[0mSending payload to [\e[1;32mECHA="$echa"\e[0m] [\e[1;32mKEYWORD="$kword"\e[0m]"
    echo ""
    nout=$(curl -i -s -k -X $'GET' -H $'Host: www.ecosia.org' -H $'Cache-Control: max-age=0' -H $'Sec-Ch-Ua: \"Chromium\";v=\"107\", \"Not=A?Brand\";v=\"24\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'Sec-Ch-Ua-Full-Version: \"107.0.5304.68\"' -H $'Sec-Ch-Ua-Arch: \"x86\"' -H $'Sec-Ch-Ua-Platform: \"Linux\"' -H $'Sec-Ch-Ua-Platform-Version: \"5.15.0\"' -H $'Sec-Ch-Ua-Model: \"\"' -H $'Sec-Ch-Ua-Bitness: \"64\"' -H $'Upgrade-Insecure-Requests: 1' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.5304.63 Safari/537.36' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H $'Sec-Fetch-Site: same-origin' -H $'Sec-Fetch-Mode: navigate' -H $'Sec-Fetch-User: ?1' -H $'Sec-Fetch-Dest: document' -H $'Accept-Encoding: gzip, deflate' -H $'Accept-Language: en-US,en;q=0.9' -b $"$cookies" $'https://www.ecosia.org/search?method=index&q='$kword | tr -d '\0')
    counter=$(curl -s -k -X $'GET' -H $'Host: api.ecosia.org' -H $'Sec-Ch-Ua: \"Chromium\";v=\"107\", \"Not=A?Brand\";v=\"24\"' -H $'Sec-Ch-Ua-Mobile: ?0' -H $'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.5304.63 Safari/537.36' -H $'Sec-Ch-Ua-Platform: \"Linux\"' -H $'Accept: */*' -H $'Origin: https://www.ecosia.org' -H $'Sec-Fetch-Site: same-site' -H $'Sec-Fetch-Mode: cors' -H $'Sec-Fetch-Dest: empty' -H $'Referer: https://www.ecosia.org/' -H $'Accept-Encoding: gzip, deflate' -H $'Accept-Language: en-US,en;q=0.9' $'https://api.ecosia.org/v1/accounts/v2/personal_counter?token='$echa)

    python3 ./print_counter.py $counter

    echo ""
    echo -e "\e[1;34m[*] \e[0mChanging keyword..."
    kword=$RANDOM
    echo -e "\e[1;34m[*] \e[0mSleeping 10 Seconds..."
    sleep 10
done
