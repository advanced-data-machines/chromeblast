#!/bin/bash
username=$1  # your google / gmail email
password=$2  # your google / gmail password
service_username=$3  # create this under the home foyer: https://myaccount.google.com/apppasswords)

# pull the access token from the result
python3 get_tokens.py $username $password $service_username | grep "Access token:" | cut -d':' -f2 > /tmp/access_token


ACCESS_TOKEN=$(cat /tmp/access_token)


./grpcurl -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -import-path ./ \
  -proto ./google/internal/home/foyer/v1.proto \
  googlehomefoyer-pa.googleapis.com:443 \
  google.internal.home.foyer.v1.StructuresService/GetHomeGraph
  | jq '.home.devices[] | {deviceName, localAuthToken}'

echo "Access_Token = ${ACCESS_TOKEN}"

# curl http://10.80.4.35:8008/setup/eureka_info
# curl http://10.80.4.35:8008/setup/supported_timezones
# curl http://10.80.4.35:8008/setup/supported_locales
# curl -H "cast-local-authorization-token: LOCAL_AUTH_TOKEN" --verbose --insecure https://10.80.4.35:8008/setup/bluetooth/status
