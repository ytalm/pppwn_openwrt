#!/bin/sh
echo "Content-Type: application/json"
echo ""

token="token_id"

read postData

token=$(echo $postData | sed -n 's/^.*token=\([^&]*\).*$/\1/p' | sed "s/%20/ /g")
task=$(echo $postData | sed -n 's/^.*task=\([^&]*\).*$/\1/p' | sed "s/%20/ /g")


if [ "$token" = "token_id" ]; then
    if [ "$task" = "restart" ]; then
        service pppwn restart
        ps www| grep -v grep | grep pppwn
        if [ "$?" -eq 0 ]; then
                echo "Restart success!"
                exit 0
        else
                echo "Restart failed!"
                exit 1
        fi
    else
        logread -e pppwn
        exit 0
    fi
else
    echo "Invalid token!"
    exit 1
fi
