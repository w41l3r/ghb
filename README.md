# ghb
Google Hacking Bot

This script uses google hacking to filter a list of subdomains and tell which ones are indexed by google. 

Also, it does some automated dorking >D

Tested in conjunction with fireprox (https://github.com/ustayready/fireprox) to avoid Google annoying stuff like "human proof shiits"

Just run fireprox, like "fire.py --command create --url https://www.google.com/ --region us-east-2 --access_key XXXXXXXXXXXX --secret_access_key JKASDJADLJKFKLJASDFJKLAJKLSDAKLJAF"

Get the generated address and put it in the URLBASE variable inside the ghb.sh script (yeah, terrible.. gonna implement this as an argument soon...)

Have fun!
