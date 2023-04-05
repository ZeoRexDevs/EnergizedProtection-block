#!/bin/bash

# Energized Protection - Mirror
# https://energized.pro

echo "[+] Saving Airelles"
AirellesAddr=http://rlwpx.free.fr/WPFF
PUB=${AirellesAddr}/hpub.7z
RSK=${AirellesAddr}/hrsk.7z
SEX=${AirellesAddr}/hsex.7z
TRC=${AirellesAddr}/htrc.7z
TWOEIGHTY=https://filter.futa.gg/280blocker/280blocker_domain_ag.txt

curl -fsSLo hpub.7z $PUB
curl -fsSLo hrsk.7z $RSK
curl -fsSLo hsex.7z $SEX
curl -fsSLo htrc.7z $TRC
curl -fsSLo 280blocker_domain_ag.txt $TWOEIGHTY

# Decompress 7z and Copy as Txt File
7z x -y hpub.7z && cp Hosts.pub airelle-pub.txt
7z x -y hrsk.7z && cp Hosts.rsk airelle-rsk.txt
7z x -y hsex.7z && cp Hosts.sex airelle-sex.txt
7z x -y htrc.7z && cp Hosts.trc airelle-trc.txt

# Remove Temp Files
rm -rf *.pub hpub.7z
rm -rf *.rsk hrsk.7z
rm -rf *.sex hsex.7z
rm -rf *.trc htrc.7z

# Remove first 6 Lines from RSK
sed -i '1,6d' airelle-pub.txt
sed -i '1,6d' airelle-rsk.txt
sed -i '1,6d' airelle-sex.txt
sed -i '1,6d' airelle-trc.txt

echo "[+] Saving UT1"
UT1Addr=ftp://ftp.ut-capitole.fr/pub/reseau/cache/squidguard_contrib
ut1Adult=${UT1Addr}/adult.tar.gz
ut1Cryptojacking=${UT1Addr}/cryptojacking.tar.gz
ut1Gambling=${UT1Addr}/gambling.tar.gz
ut1Phishing=${UT1Addr}/phishing.tar.gz
ut1Publicite=${UT1Addr}/publicite.tar.gz
ut1Social=${UT1Addr}/social_networks.tar.gz

wget -q --show-progress $ut1Adult
wget -q --show-progress $ut1Cryptojacking
wget -q --show-progress $ut1Gambling
wget -q --show-progress $ut1Phishing
wget -q --show-progress $ut1Publicite
wget -q --show-progress $ut1Social

# Untar tar.gz
tar -zxvf adult.tar.gz "adult/domains"
mv -f adult/domains ut1-adult.txt
rm -r adult/
tar -zxvf cryptojacking.tar.gz "cryptojacking/domains"
mv -f cryptojacking/domains ut1-cryptojacking.txt
rm -r cryptojacking
tar -zxvf gambling.tar.gz "gambling/domains"
mv -f gambling/domains ut1-gambling.txt
rm -r gambling
tar -zxvf phishing.tar.gz "phishing/domains"
mv -f phishing/domains ut1-phishing.txt
rm -r phishing
tar -zxvf publicite.tar.gz "publicite/domains"
mv -f publicite/domains ut1-publicite.txt
rm -r publicite
tar -zxvf social_networks.tar.gz "social_networks/domains"
mv -f social_networks/domains ut1-social-networks.txt
rm -r social_networks

rm -f *.tar.gz
