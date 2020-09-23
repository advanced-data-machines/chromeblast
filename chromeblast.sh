#!/bin/bash
username=$1  # your google / gmail email
password=$2  # your google / gmail password
service_username=$3  # create this under the home foyer: https://myaccount.google.com/apppasswords)

docker build -t chromeblast .

docker run --rm -it chromeblast $username $password $service_username
