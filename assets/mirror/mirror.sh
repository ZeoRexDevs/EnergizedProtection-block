#!/bin/bash

# Energized Protection - Mirror
# https://energized.pro

curl -fsSL https://github.com/EnergizedProtection/mirror/raw/master/active/filter/280blocker.txt -o 280blocker_domain_ag.txt

curl -fsSL https://github.com/EnergizedProtection/mirror/raw/master/active/filter/airelle-pub.txt -O
curl -fsSL https://github.com/EnergizedProtection/mirror/raw/master/active/filter/airelle-rsk.txt -O
curl -fsSL https://github.com/EnergizedProtection/mirror/raw/master/active/filter/airelle-sex.txt -O
curl -fsSL https://github.com/EnergizedProtection/mirror/raw/master/active/filter/airelle-trc.txt -O

# Remove first 6 Lines from RSK
sed -i '1,6d' airelle-pub.txt
sed -i '1,6d' airelle-rsk.txt
sed -i '1,6d' airelle-sex.txt
sed -i '1,6d' airelle-trc.txt
sed -i '/^#\s/d' airelle-*.txt

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
