#!/bin/bash


# This function will return a single block of JSON for a single service.
exportService() {
  echo '{'
  echo '  "service" : {'
  echo '    "name":"'$1'",'
  echo '    "ipaddress":"'${ip}'",'
  echo '    "netmask":"'${nm}'",'
  echo '    "gateway":"'${gw}'"'
  echo '  }'
  echo '}'
}

# Output the Wi-Fi information.
ip=$(networksetup -getinfo wi-fi | grep -Ei '(^IP address:)' | awk '{print $3}')
gw=$(netstat -nr | grep default |head -n 1| awk '{print $2}')
nm=$(result=$(ifconfig en0 | grep 'netmask' | awk '{print $4}')
 
echo $result | sed 's/0x// ; s/../& /g' | tr [:lower:] [:upper:] | while read B1 B2 B3 B4 ; do                             
        echo "ibase=16;$B1;$B2;$B3;$B4" | bc | tr '\n' . | sed 's/\.$//'                                       
done

)
exportService "wi-fi"

# End the JSON
