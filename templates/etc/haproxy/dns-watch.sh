CURRENT_DNS_RESOLVED=`host $2 | awk '/has address/ { print $4 }'`

echo $CURRENT_DNS_RESOLVED

while :
do
  echo Testing

  NEW_DNS_RESOLVED=`host $2 | awk '/has address/ { print $4 }'`

  if [ "$NEW_DNS_RESOLVED" != "$CURRENT_DNS_RESOLVED" ]; then
    echo "CHANGE DETECTED"
    echo "$NEW_DNS_RESOLVED"

    bash $3

    CURRENT_DNS_RESOLVED="$NEW_DNS_RESOLVED"
  fi

  sleep $1
done
