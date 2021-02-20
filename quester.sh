 #!/bin/bash

#QUESTER           Author: Febin.     Twitter: twitter.com/febinrev#


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
#Nested Function
	urls(){
	curl "$1" --connect-timeout 2  -s | strings |  sed s/"http:"/"\nhttp:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep http://
	curl "$1" --connect-timeout 2  -s  | strings | sed s/"https:"/"\nhttps:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep https://
	curl "$1" -s -f --connect-timeout 2 | strings | tr "<>" "\n" | sed s/src=/"SrC:"/g | sed s/" "/"\n"/g | tr -d "<'>" | tr -d '"' | grep SrC: | sed s/"SrC:"//g
	curl "$1" -s -f --connect-timeout 2 |strings | tr "<>" "\n" | sed s/href=/"HReF:>"/g | sed s/" "/"\n"/g | tr -d "<'>" | tr -d '"' | grep HReF: | sed s/"HReF:"//g
	}

urls $URL | sort -u

printf "\n*********************\n"



}

getparams(){
URL=$1

printf "Parameters In $URL\n"
printf "~~~~~~~~~~~~~~~~~~~~~\n"
curl $URL --connect-timeout 2 -s | strings | grep "<input " | sed s/name=/"\nPaRam:"/g | sed s/" "/"\n"/g | tr "<>" "\n" | grep "PaRam:" | sed s/"PaRam:"//g

printf "\n~~~~~~~~~~~~~~~~~~~~~\n"
}


shodan1(){

domain=$(curl "https://api.shodan.io//dns/resolve?key=MM72AkzHXdHpC8iP65VVEEVrJjp7zkgd&hostnames=$1" -s | sed s/"{"//g | sed s/"}"//g | sed s/$1//g | sed s/'"'//g | sed s/": "//g)

if [ "$domain" == "null" ]
then
	echo "$1 not found in shodan Database"
else
	echo $1  : $domain
	curl "https://api.shodan.io//shodan/host/$domain?key=MM72AkzHXdHpC8iP65VVEEVrJjp7zkgd&minify=true" -s | jq | tr "{}" " " | sed s/":"/" ==> "/g | tr '"' " "
	printf "\n~~~~~~~~~~~~~~~~~~~~\n\n"
fi
}


usage(){
	printf "
<------------>
<  QU35T3R   >       Author: Febin     Twitter: twitter.com/febinrev
<------------>	
Usage:
	
$0 -h                                                   #Help Message

$0 [options] <wordlist>
 
 $0 -all urls.txt                                       # crawls over the given URLs and prints status
 $0 all urls.txt
 $0 -match-code <status_code> urls.txt                  # Matches URLs According to the Status Code
 $0 -match-length <Length> urls.txt                     # Matches URLs According to the Content Length
 $0 -endpoints urls.txt                                 # Extracts Endpoints from Given URLs
 $0 -endpoints -url http://target.com/index             # Extracts Endpoints from Given URL
 $0 -subdomains subdomains.txt                          # Extracts Valid SubDomains, Compatible with subfinder
 $0 -parameters urls.txt                                # Extracts Input Parameters from the given list of URLs
 $0 -parameters -url http://target.com/index            # Extracts Parameters from the given URL
 $0 -shodan domains.txt                                 # Searches the domains in Shodan database
 $0 -shodan -domain target.com                          # Searches the given domain in Shodan

			\n"
}

curl=$(which curl)
jq=$(which jq)

if [ $curl ] && [ $jq ]
then
	if [ "$1" == "-h" ] || [ "$1" == "--help" ]
	then
	usage
	
	elif [ "$1" == "-match-code" ] && [ $2 ] &&[ -f $3 ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"          
		for w in $(cat $3 | sort -u)
		do                                                                                
		geturl_curl $w | grep "HTTP/*.*$2"
		done
	
	
	elif [ "$1" == "-match-length" ] && [ $2 ]  && [ -f $3 ]
	then
	printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
	printf "\n"     
	for w in $(cat $3 | sort -u)
	do                                                                                        
	geturl_curl $w | grep "L: $2"
	done
	
	
	elif [ "$1" == "-subdomains" ] && [ -f $2 ]
	then
	printf "Domain                                                                                     HTTP Status            Content-Length  \n"
	printf "\n" 
	for w in $(cat $2 | sort -u)
	do                                                                                            
	getdomain_curl $w | grep "HTTP/*.*"
	done
	
	elif [ "$1" == "-endpoints" ] && [ -f $2 ]
	then
		for w in $(cat $2 | sort -u)
		do   
		extract_endpoints $w
		done

	elif [ "$1" == "-endpoints" ] && ([ "$2" == "-u"  ] || [ "$2" == "-url"  ]) && [ $3 ] 
	then
	extract_endpoints $3

	
	elif [ "$1" == "-parameters" ] && [ -f $2 ]
	then
		for w in $(cat $2 | sort -u)
		do   
		getparams $w
		done
	
	elif [ "$1" == "-parameters" ] && ([ "$2" == "-u"  ] || [ "$2" == "-url"  ]) && [ $3 ] 
	then
	getparams $3

	elif [ "$1" == "-shodan" ] && [ -f $2 ]
	then
		for w in $(cat $2 | sort -u)
		do   
		shodan1 $w
		done

	elif [ "$1" == "-shodan" ] && ([ "$2" == "-d"  ] || [ "$2" == "-domain"  ]) && [ $3 ] 
	then
	shodan1 $3



	elif [[ "$1" == "all" ]] || [[ "$1" == "-all" ]] && [ -f $2 ]
	then
		printf "Domain/URL                                                                                HTTP Status            Content-Length  \n"
		printf "\n"              
		for w in $(cat $2 | sort -u)
		do                                                                            
		geturl_curl $w
		done
	else
	printf "\033[1;31m Error: Invalid Arguments! \n \033[1;32m"
	usage
	
	fi

else
	echo "Curl / Jq Not Found! It is necessary for this to to run!"
fi


