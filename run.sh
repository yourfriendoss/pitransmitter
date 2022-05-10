#!/bin/bash

freq=$(jq .freq config.json)
ps=$(jq .ps config.json)
rt=$(jq .rt config.json)
pty=$(jq .pty config.json)

echo $freq $ps $rt $pty

cd src
make

# assuming src/pi_fm_adv

./src/pi_fm_adv --freq $freq --ps $ps --rt $rt --pty $pty
