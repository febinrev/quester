 #!/bin/bash

#QUESTER           Author: Febin.     Twitter: twitter.com/febinrev#



ua[0]="Mozilla/5.0 (Linux; Android 8.0.0; SM-G960F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36"
ua[1]="Mozilla/5.0 (Linux; Android 7.0; SM-G930VC Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36"
ua[2]='Mozilla/5.0 (Linux; Android 6.0.1; Nexus 6P Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36'
ua[3]="Mozilla/5.0 (Linux; Android 7.1.1; G8231 Build/41.2.A.0.219; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/59.0.3071.125 Mobile Safari/537.36"
ua[4]="Mozilla/5.0 (Linux; Android 6.0; HTC One X10 Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/61.0.3163.98 Mobile Safari/537.36"
ua[5]="Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1"
ua[6]="Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/69.0.3497.105 Mobile/15E148 Safari/605.1"
ua[7]="Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/13.2b11866 Mobile/16A366 Safari/605.1.15"
ua[8]="Mozilla/5.0 (Windows Phone 10.0; Android 6.0.1; Microsoft; RM-1152) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Mobile Safari/537.36 Edge/15.15254"
ua[9]="Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Microsoft; Lumia 950) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.1058"
ua[10]="Mozilla/5.0 (Linux; Android 6.0.1; SHIELD Tablet K1 Build/MRA58K; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/55.0.2883.91 Safari/537.36"
ua[10]='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246'
ua[11]='Mozilla/5.0 (X11; CrOS x86_64 8172.45.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.64 Safari/537.36'
ua[12]='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9'
ua[13]='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.111 Safari/537.36'
ua[14]='Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.0.1'
ua[15]='Mozilla/5.0 (CrKey armv7l 1.5.16041) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.0 Safari/537.36'
ua[16]='Mozilla/5.0 (Linux; U; Android 4.2.2; he-il; NEO-X5-116A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30'
ua[17]='AppleTV5,3/9.1.1'
ua[18]='AppleTV6,2/11.1'
ua[19]='Dalvik/2.1.0 (Linux; U; Android 6.0.1; Nexus Player Build/MMB29T)'
ua[20]='Mozilla/5.0 (Nintendo WiiU) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.4.2.12 NintendoBrowser/4.3.1.11264.US'
ua[21]='Mozilla/5.0 (Windows NT 10.0; Win64; x64; XBOX_ONE_ED) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393'
ua[22]='Mozilla/5.0 (Windows Phone 10.0; Android 4.2.1; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Mobile Safari/537.36 Edge/13.10586'
ua[23]='Mozilla/5.0 (PlayStation 4 3.11) AppleWebKit/537.73 (KHTML, like Gecko)'
ua[24]='Mozilla/5.0 (X11; U; Linux armv7l like Android; en-us) AppleWebKit/531.2+ (KHTML, like Gecko) Version/5.0 Safari/533.2+ Kindle/3.0+'
ua[25]='Mozilla/5.0 (Linux; U; en-US) AppleWebKit/528.5+ (KHTML, like Gecko, Safari/528.5+) Version/4.0 Kindle/3.0 (screen 600x800; rotate)'
ua[26]='Google/1'
ua[27]='Yahoo'
ua[28]='Firefox'
ua[29]='Wordpress'
ua[30]='Linux'


geturl_curl(){

user_agent_num=$(shuf -i 0-30 -n 1)
useragent=${ua[$user_agent_num]}
URL=""

URL=$1
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "$URL" -H "User-Agent: $useragent" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"L: "/g 

printf "\n"

}


getdomain_curl(){
user_agent_num=$(shuf -i 0-30 -n 1)
useragent=${ua[$user_agent_num]}

URL=""

URL=$1
len=$(printf "%s" "$URL" | wc -m)
pad=$(expr 80 - $len)
printf "%s" "$URL "
printf "%${pad}s"
curl -X HEAD "http://$URL"  -H "User-Agent: $useragent" --head --connect-timeout 2  -s | grep "HTTP/\|Content-Length"  | tr "\r\n" "           "  | sed s/"Content-Length: "/"  L: "/g 

printf "\n"

}



extract_endpoint(){
URL=$1
printf "Endpoints in $URL\n"
printf "*********************\n"
#Nested Function
	urls(){
	user_agent_num=$(shuf -i 0-30 -n 1)
	useragent=${ua[$user_agent_num]}
	curl "$1"  -H "User-Agent: $useragent" --connect-timeout 2  -s | strings |  sed s/"http:"/"\nhttp:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep http://
	curl "$1"  -H "User-Agent: $useragent" --connect-timeout 2  -s  | strings | sed s/"https:"/"\nhttps:"/g | tr "<> " "\n" | sed s/"'"/"\n"/g | sed s/'"'/"\n"/g | grep https://
	curl "$1"  -H "User-Agent: $useragent" -s -f --connect-timeout 2 | strings | tr "<>" "\n" | sed s/src=/"SrC:"/g | sed s/" "/"\n"/g | tr -d "<'>" | tr -d '"' | grep SrC: | sed s/"SrC:"//g
	curl "$1"  -H "User-Agent: $useragent" -s -f --connect-timeout 2 |strings | tr "<>" "\n" | sed s/href=/"HReF:>"/g | sed s/" "/"\n"/g | tr -d "<'>" | tr -d '"' | grep HReF: | sed s/"HReF:"//g
	}

urls $URL | sort -u

printf "\n*********************\n"



}

endpoints_online(){
URL=$1
printf "Endpoints in $URL\n"
printf "*********************\n"
user_agent_num=$(shuf -i 0-30 -n 1)

curl https://www.bulkdachecker.com/url-extractor/extract.php -X POST -d "type=6&url=$URL" -H "User-Agent: $useragent" --connect-timeout 2  -s 


printf "\n*********************\n"

}

extract_endpoints(){


endpoints_online $1 2>/dev/null || extract_endpoint $1


}

getparams(){
user_agent_num=$(shuf -i 0-30 -n 1)
useragent=${ua[$user_agent_num]}
URL=$1

printf "Parameters In $URL\n"
printf "~~~~~~~~~~~~~~~~~~~~~\n"
curl "$URL"  -H "User-Agent: $useragent" --connect-timeout 2 -s | strings | grep "<input " | sed s/name=/"\nPaRam:"/g | sed s/" "/"\n"/g | tr "<>" "\n" | grep "PaRam:" | sed s/"PaRam:"//g

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

cms(){
URL=$1

curl -L -s "https://whatcms.org/APIEndpoint?key=759cba81d90c6188ec5f7d2e2bf8568501a748d752fd2acdba45ee361181f58d07df7d&url=$URL" | jq | grep "id\|name\|confidence\|version\|cms_url" | tr -d '"'



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
 $0 -cms <url>                                          #  Detects the CMS of given URL

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

	elif [ "$1" == "-cms" ] && [ $2 ] 
	then
	echo ""
	cms $2
	echo ""


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


