#!/usr/bin/env sh

WATCH="${HUGO_WATCH:=false}"
echo "HUGO_WATCH:" $WATCH
echo "HUGO_THEME:" $HUGO_THEME
echo "HUGO_BASEURL" $HUGO_BASEURL
echo "HUGO_BIND_IP" $HUGO_BIND_IP
echo "HUGO_PORT" $HUGO_PORT

HUGO=/usr/bin/hugo

if [[ $HUGO_WATCH != 'false' ]]; then
  echo "Watching..."
    $HUGO server --watch=true --theme="$HUGO_THEME" --destination="public" --bind=$HUGO_BIND_IP --appendPort=false --baseUrl="$HUGO_BASEURL" --port=$HUGO_PORT || exit 1
else
  echo "Serving Only..."
    $HUGO server --watch=$WATCH --theme="$HUGO_THEME" --destination="public" --bind=$HUGO_BIND_IP --appendPort=false --baseUrl="$HUGO_BASEURL" --port=$HUGO_PORT || exit 1
fi
