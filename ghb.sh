#!/bin/bash
#
# ghb.sh - Google Hacking Bot
#

#URLBASE="https://www.google.com/"
# or uncomment this if using Fireprox (fireprox-produced url after executing fire.py --command create --url https://www.google.com/ ... )
URLBASE="https://2xyz3xyz4xyz.execute-api.us-east-2.amazonaws.com/fireprox/"

SUBSFILE=$1
rm -f /tmp/fooo /tmp/resultz.txt /tmp/subsz

function check_search_results() {

	SEARCH=$1
	GREEN='\033[0;32m'
	NC='\033[0m' # Sem cor

	if grep -i -e "Certifique-se de que todas as palavras estejam escritas corretamente" \
            -e "Make sure that all words are spelled correctly"\
	    -e "did not match any documents" /tmp/fooo >/dev/null
    	then
       		 echo " [!] nothing found."
		 return 1
    	else
		 printf "${GREEN}[*] FOUND SOMETHING !!!${NC}\n"
        	 echo $SEARCH >> /tmp/resultz.txt
		 return 0
	fi

}

function dork_it() {

	TARGET=$1
        if [ -z ${TARGET} ];then
             echo "No target informed. Aborting..."
	     exit 1
	fi

	echo |tee -a /tmp/resultz.txt
	echo "========================" | tee -a /tmp/resultz.txt
	echo "Starting Google Dorks..." | tee -a /tmp/resultz.txt
	echo "========================" | tee -a /tmp/resultz.txt
	echo
	echo "[*] Searching trello..."
	MYDORK="${URLBASE}search?q=site%3Atrello.com%20AND%20intext:${TARGET}"
	curl -H 'User-Agent: Googlebot' -s $MYDORK -o /tmp/fooo
	check_search_results "$MYDORK"
	echo
	echo "[*] Searching pastebin..."
	MYDORK="${URLBASE}search?q=site%3Apastebin.com%20AND%20intext:${TARGET}"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching txt files..."
	MYDORK="${URLBASE}search?q=inurl%3A${TARGET}%20AND%20filetype:txt"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching log files..."
	MYDORK="${URLBASE}search?q=inurl%3A${TARGET}%20AND%20filetype:log"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching bkp files..."
	MYDORK="${URLBASE}search?q=inurl%3A${TARGET}%20AND%20filetype:bkp"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching sql files..."
	MYDORK="${URLBASE}search?q=inurl%3A${TARGET}%20AND%20filetype:sql"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching web files..."
	MYDORK="${URLBASE}search?q=inurl%3A${TARGET}%20filetype:asp%20%7C%20filetype:aspx%20%7C%20filetype:php%20%7C%20filetype:jsp%20%7C%20filetype:ashx"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching admin sites..."
	MYDORK="${URLBASE}search?q=intitle%3Aadmin%20AND%20${TARGET}"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching office files..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20ext%3Axls%20%7C%20ext%3Adoc%20%7C%20ext%3Axlsx%20%7C%20ext%3Adocx%20%7C%20ext%3Aodt%20%7C%20ext%3Artf%20%7C%20ext%3Asxw%20%7C%20ext%3Apsw%20%7C%20ext%3Appt%20%7C%20ext%3Apptx%20%7C%20ext%3Apps%20%7C%20ext%3Acsv%20"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching sites with Directory Listing..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20%22index%20of%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching WordPress sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20wp-content"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching Weblogic sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20intitle%3A%22weblogic%22%20login%20intext%3A%22footer%20powered%20by%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching Drupal sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20inurl%3A%22sites/all/modules/ckeditor%22%20-drupalcode.org"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching Joomla sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20intitle%3A%22Index%20of%20/%22%20%22joomla/database%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching GLPI sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20intitle%3A%22GLPI%20-%20Authentication%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching BIG-IP(F5) sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20intitle%3A%22BIG-IP%22%20inurl%3A%22tmui%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"
	echo
	echo "[*] Searching BIG-IP(F5) - DORK2 - sites..."
	MYDORK="${URLBASE}search?q=site%3A${TARGET}%20inurl%3A%22tmui%2Flogin.jsp%22"
	curl -H 'User-Agent: Googlebot' -s "$MYDORK" -o /tmp/fooo
        check_search_results "$MYDORK"

	echo
	echo "Finished dorking!"
	echo
	echo "==================================="
	echo "Final Results (indexed subdomains):"
	echo "==================================="
	cat /tmp/resultz.txt
	echo
	echo "Have a nice day :D"
	exit 0

	
}

if [ $# -eq 0 ];then
    echo "Syntax: $0 subdomains-file"
    echo "  subdomains-file: file containing subdomains to look for"
    exit 9
fi

if [ ! -s $SUBSFILE ];then
    echo "File ${SUBSFILE} empty or inexistent. Aborting..."
    exit 1
fi

if cat $SUBSFILE | grep -i -e 'http://' -e 'https://' > /dev/null
then
	cat $SUBSFILE | sed -e 's_http:\/\/__g' -e 's_https:\/\/__g' > /tmp/subsz
fi

if [ -s /tmp/subsz ];then
	SUBSFILE=/tmp/subsz
fi

cat $SUBSFILE | while read GSEARCH
do

    echo "Searching $GSEARCH ..."

    curl -H 'User-Agent: Googlebot' -s ${URLBASE}search?q=site%3A${GSEARCH} -o /tmp/fooo
    check_search_results $GSEARCH

done

echo "File /tmp/resultz.txt created successfully!"
echo
echo "============================================"
echo " Sites with some contents indexed by Google:"
echo "============================================"
cat /tmp/resultz.txt | while read lin
do
	echo "${URLBASE}search?q=site%3A${lin}"
done

rm -f /tmp/fooo /tmp/subsz

echo
echo -n "Do you want me to try some DORKS?(y/N) "
read RESP
echo
case $RESP in
	y|Y) echo -n "Please type the target domain: "
	     read TARGET
	     if [ -z ${TARGET} ];then
		     echo "No target informed. Aborting..."
		     exit 1
	     else
	     	dork_it $TARGET
	     fi
	     ;;
esac
echo
echo "Have a nice day :D"
exit 0
