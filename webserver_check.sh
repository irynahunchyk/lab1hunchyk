#!/bin/bash

SERVER_URL=${SERVER_URL:-"http://nginx:80"}
LOG_FILE=${LOG_FILE:-"/var/log/my-script.log"}


function check_status {
status=$(curl -s -o /dev/null -w '%{http_code}' $SERVER_URL)
echo "$status"

if (( status < 200 || status > 399 )); then
message="Server returned status $status at $(date '+%Y-%m-%d %H:%M:%S')"
echo "$(date "+%Y-%m-%d %H:%M:%S") $message" >> $LOG_FILE
curl -s --user 'api:1e1b07c4128249aa81c245639c6f062b-6b161b0a-6e06d220' \
	 https://api.mailgun.net/v3/sandboxe5b1133054444cee9eea7f188203efe9.mailgun.org/messages \
	 -F from='Mailgun Sandbox <mailgun@sandboxe5b1133054444cee9eea7f188203efe9.mailgun.org>' \
	 -F to=gunchikiryna@gmail.com \
	 -F subject='Hello Iryna' \
	 -F text='Congratulations Iryna, you just sent an email with Mailgun!  You are truly awesome!'
fi
}



check_status
