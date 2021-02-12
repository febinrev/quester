#!/bin/bash

#QUESTER           Coded by Febin.     Twitter: twitter.com/febinrev#
geturl_curl(){

URL=""

while [ ! "$URL" == "end" ]
do
read URL
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "$URL" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"L: "/g 

printf "\n"
done
}


getdomain_curl(){

URL=""

while [ ! "$URL" == "end" ]
do
read URL
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "http://$URL" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"  L: "/g 

printf "\n"
done
}




curl=$(which curl)
if [ $curl ]
then
	if [ "$1" == "-h" ] || [ "$1" == "--help" ]
	then
	printf "
<------------>
<   QU35T3R  >       Coded by Febin.     Twitter: twitter.com/febinrev
<------------>	
Usage:
	
$0 -h                                                                                           #Help Message

cat urls.txt | $0 -match-code <status_code>
cat urls.txt | $0 -match-length <Length>
subfinder -d domain.com -silent | $0 -subdomains                           #Extracts Valid SubDomains, Compatible with subfinder

Examples:
			echo domain.com | waybackurls | $0
                         
                        cat urls.txt | $0
                        
                        cat subdomains.txt | $0 -subdomains
                                
			echo domain.com | waybackurls | $0 -match-code 200 
			
			subfinder -d domain.com -silent | $0 -subdomains
			
			\n"
	
	elif [ "$1" == "-match-code" ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"                                                                                          
	geturl_curl | grep "HTTP/*.*$2"
	
	elif [ "$1" == "-match-length" ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"                                                                                          
	geturl_curl | grep "L: $2"
	
	elif [ "$1" == "-subdomains" ]
	then
	printf "Domain                                                                                     HTTP Status            Content-Length  \n"
	printf "\n"                                                                                          
	getdomain_curl | grep "HTTP/*.*"
	
	else
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"                                                                                          
	geturl_curl
	
	fi

else
	echo "Curl Not Found! It is necessary for this to to run!"
fi
