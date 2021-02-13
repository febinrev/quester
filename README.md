# QU35T3R

### QUESTER is a Web Pentesting &amp; Bug Bounty Recon tool which queries URLs / Subdomains from the given list of URLs or Subdomains.

Compatible with other tools like Subfinder, waybackurls, sublist3r:

subfinder -d target.com -silent > subdomains.txt
echo target.com | waybackurls > urls.txt


./quester.sh -all urls.txt

./quester.sh -subdomains subdomains.txt

----------------------------------------------------------------------------------------------------------------------------------------------

             <------------>
             <   QU35T3R  >       Coded by Febin.     Twitter: twitter.com/febinrev
             <------------>	
             Usage:
	
            ./quester.sh -h                                                     #Help Message

            ./quester.sh [options] <wordlist>
 
             ./quester.sh -all urls.txt                                         # crawls over the given URLs and prints status
             ./quester.sh all urls.txt
             ./quester.sh -match-code <status_code> urls.txt
             ./quester.sh -match-length <Length> urls.txt
             ./quester.sh -endpoints urls.txt                                   #Extracts Endpoints from Given URLs
             ./quester.sh -endpoints -url http://target.com/index               #Extracts Endpoints from Given URL
             ./quester.sh -subdomains subdomains.txt                            #Extracts Valid SubDomains, Compatible with subfinder


    ------------------------------------------------------------------------------------------------------------------------------------------------

