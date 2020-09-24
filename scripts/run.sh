#!/bin/bash
username=$1  # your google / gmail email
password=$2  # your google / gmail password
service_username=$3  # create this under the home foyer: https://myaccount.google.com/apppasswords)

# pull the access token from the result
python3 get_tokens.py $username $password $service_username | grep "Access token:" | cut -d':' -f2 > /tmp/access_token


ACCESS_TOKEN=$(cat /tmp/access_token)

echo
echo "Access_Token = ${ACCESS_TOKEN}"
echo
echo "localAuthToken = "
./grpcurl -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -import-path ./ \
  -proto ./google/internal/home/foyer/v1.proto \
  googlehomefoyer-pa.googleapis.com:443 \
  google.internal.home.foyer.v1.StructuresService/GetHomeGraph \
  | grep localAuthToken

#  | jq '.home.devices[] | {deviceName, localAuthToken}'
echo  
echo "If above is empty then likely your device is not yet registered with Google home foyer, etc."

echo "******************************************************"
echo "These api calls with work with out a localAuthToken"
echo "******************************************************"
echo "curl http://<ip_of_chromecast>:8008/setup/eureka_info"
echo "curl http://<ip_of_chromecast>:8008/setup/supported_timezones"
echo "curl http://<ip_of_chromecast>:8008/setup/supported_locales"
echo 
echo "******************************************************"
echo "Example GET request with localAuthToken (fails)"
echo "******************************************************"
echo "curl -H 'cast-local-authorization-token: REPLACE_WITH_LOCAL_AUTH_TOKEN' --verbose --insecure https://<ip_of_chromecast>:8008/setup/bluetooth/status"
echo 
echo
echo
