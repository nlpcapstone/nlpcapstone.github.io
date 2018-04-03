#!/usr/bin/env bash
set -e

current_date_time="`date +%Y%m%d%H%M%S`";

# go to home
cd ~

# go to venus directory
cd venus

# activate venus environment
source activate venus

# Pull changes from planet
python planet.py ~/Documents/Github/nlpcapstone.github.io/capstone_2018.ini

# push changes to github
cd ~/Documents/Github/nlpcapstone.github.io/
ssh-add ~/.ssh/id_rsa_nlpcapstonebot
git add -A
git commit --no-gpg-sign -m "Update aggregator ${current_date_time}"
git push
