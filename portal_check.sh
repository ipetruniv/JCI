#!/bin/bash
attempts=5
timeout=30
online=false
failscount=0
failsmax=4

function checksite() {
	#echo "Checking status of $url"
	for (( i=1; i<=$attempts; i++ ))
	do
	  code=`curl -sL --connect-timeout 20 --max-time 30 -w "%{http_code}\\n" "$url" -o /dev/null`
	  #echo "Found code $code for $url"

	  if [ "$code" = "200" ]; then
	    echo "Website $url is online."
	    online=true
	    #break
	  else
	    echo "Website $url seems to be offline. Waiting $timeout seconds."
	    sleep $timeout
            online=false
	    let "failscount = $failscount + 1"
	  fi
	done
}


#echo "Checking Admin Portal"
url='http://stepmdmqa.labcorp.ad.ctc/portal/CTRAdminPortal'
checksite

#echo "Checking Internal User Portal Data Vault"
url='http://stepmdmqa.labcorp.ad.ctc/portal/CTRInternalUserPortal'
checksite

#echo "Checking Supplier Portal"
url='http://stepmdmqa.labcorp.ad.ctc/portal/CTRSupplierPortal_SS'
checksite

#echo "Checking Digital Content Author Portal"
url='http://stepmdmqa.labcorp.ad.ctc/portal/CTRDigitalContentAuthorPortal'
checksite

#echo "Checking Product Sourcing Portal"
url='http://stepmdmqa.labcorp.ad.ctc/webui/CTRProductSourcingPortal'
checksite


echo "$online $failscount"

if [ $online == 'true' ] && [ $failscount -lt $failsmax ];  then
  echo "Monitor finished, websites is online."
  echo "Online: $online"
  echo "Fail count: $failscount"
  exit 0
else
  echo "Monitor failed, website seems to be down."
  exit 1
fi

