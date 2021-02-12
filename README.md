# QU35T3R

QUESTER is a Web Pentesting &amp; Bug Bounty Recon tool which queries URLs / Subdomains from the given input stream.



----------------------------------------------------------------------------------------------------------------------------------------------


      <------------>
      <   QU35T3R  >       Coded by Febin.     Twitter: twitter.com/febinrev
      <------------>	
      Usage:
	
     ./quester.sh -h                                                                    #Help Message

      cat urls.txt | ./quester.sh -match-code <status_code>
      cat urls.txt | ./quester.sh -match-length <Length>
      subfinder -d domain.com -silent | ./quester.sh -subdomains                 #Extracts Valid SubDomains, Compatible with subfinder

      Examples:
                     echo domain.com | waybackurls | ./quester.sh
                         
                     cat urls.txt | ./quester.sh
                        
                     cat subdomains.txt | ./quester.sh -subdomains
                                
                     echo domain.com | waybackurls | ./quester.sh -match-code 200 
			
                     subfinder -d domain.com -silent | ./quester.sh -subdomains
    ------------------------------------------------------------------------------------------------------------------------------------------------

![Scrnsht1](https://github.com/febinrev/quester/raw/main/Screenshots/Screenshot%20from%202021-02-12%2020-45-35.png)

![scrnsht2](https://github.com/febinrev/quester/raw/main/Screenshots/Screenshot%20from%202021-02-12%2020-47-06.png)

![Banner](https://github.com/febinrev/quester/raw/main/Screenshots/Screenshot%20from%202021-02-12%2021-08-31.png)



