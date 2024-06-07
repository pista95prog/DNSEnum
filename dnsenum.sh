#!/bin/bash
DNS_SERVER="<DNS_IP>" # Specify IP address
IP_RANGE="<IP_RANGE>" # Specify IP range

for HOST in $(seq 1 254);
 do
   IP="$IP_RANGE.$HOST"
   nslookup "$IP" $DNS_SERVER 1>&2>/dev/null # Try to resolve IP to a hostname
   if [[ $? -eq 0 ]]; # If nslookup exited with 0, the query was successful = host found
    then
       echo "Host ($IP) found via DNS:"
       nslookup "$IP" $DNS_SERVER # Print info
    fi
 done
