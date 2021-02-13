#!/bin/bash

#QUESTER           Coded by Febin.     Twitter: twitter.com/febinrev#
geturl_curl(){

URL=""

URL=$1
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "$URL" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"L: "/g 

printf "\n"

}


getdomain_curl(){

URL=""

URL=$1
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "http://$URL" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"  L: "/g 

printf "\n"

}



extract_endpoints(){
URL=$1
printf "Endpoints in $URL\n"
printf "*********************\n"
curl "$URL" --connect-timeout 2  -s | sed s/"http:"/"\nhttp:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep http://
curl "$URL" --connect-timeout 2  -s  | sed s/"https:"/"\nhttps:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep https://

printf "*********************\n"



}


usage(){
	printf "
<------------>
<   QU35T3R  >       Coded by Febin.     Twitter: twitter.com/febinrev
<------------>	
Usage:
	
$0 -h                                                                                           #Help Message

$0 [options] <wordlist>
 
 $0 -all urls.txt                                                     # crawls over the given URLs and prints status
 $0 all urls.txt
 $0 -match-code <status_code> urls.txt
 $0 -match-length <Length> urls.txt
 $0 -endpoints urls.txt                                            #Extracts Endpoints from Given URLs
 $0 -endpoints -url http://target.com/index             #Extracts Endpoints from Given URL
 $0 -subdomains subdomains.txt                            #Extracts Valid SubDomains, Compatible with subfinder

			\n"
}

curl=$(which curl)
if [ $curl ]
then
	if [ "$1" == "-h" ] || [ "$1" == "--help" ]
	then
	usage
	
	elif [ "$1" == "-match-code" ] && [ -f $3 ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"          
		for w in $(cat $3)
		do                                                                                
		geturl_curl $w | grep "HTTP/*.*$2"
		done
	
	
	elif [ "$1" == "-match-length" ] && [ -f $3 ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"     
	for w in $(cat $3)
	do                                                                                        
	geturl_curl $w | grep "L: $2"
	done
	
	
	elif [ "$1" == "-subdomains" ] && [ -f $2 ]
	then
	printf "Domain                                                                                     HTTP Status            Content-Length  \n"
	printf "\n" 
	for w in $(cat $2)
	do                                                                                            
	getdomain_curl $w | grep "HTTP/*.*"
	done
	
	elif [ "$1" == "-endpoints" ] && [ -f $2 ]
	then
		for w in $(cat $2)
		do   
		extract_endpoints $w
		done

	elif [ "$1" == "-endpoints" ] && [ "$2" == "-u"  ] || [ "$2" == "-url"  ]
	then
	extract_endpoints $3


	elif [[ "$1" == "all" ]] || [[ "$1" == "-all" ]] && [ -f $2 ]
	then
		printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
		printf "\n"              
		for w in $(cat $2)
		do                                                                            
		geturl_curl $w
		done
	else
	printf "\033[1;31m Error: Invalid Arguments! \n \033[1;32m"
	usage
	
	fi

else
	echo "Curl Not Found! It is necessary for this to to run!"
fi
