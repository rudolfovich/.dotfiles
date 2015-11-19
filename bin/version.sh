#!/bin/bash

PLAYKEY_API=http://api.playkey.net/update.aspx
PLAYKEY_SOFTWARE=windows-desktop

if [[ -n "$1" ]]
then 
  case "$1" in
    "war")
      PLAYKEY_API=http://api.playkey.net/update.aspx
      ;;
    "dev")
      PLAYKEY_API=http://apidev.playkey.net/update.aspx
      ;;
    "beta")
      PLAYKEY_API=http://apibeta.playkey.net/update.aspx
      ;;
  esac
fi

if [[ -n "$2" ]]
then 
  PLAYKEY_SOFTWARE="$2"
fi

export PLAYKEY_VERSION=$(\
curl -s "${PLAYKEY_API}?software=${PLAYKEY_SOFTWARE}" | \
  grep '<version>' | \
  sed 's/<\/*version>//g' | \
  sed 's/ //g' \
)
echo -n ${PLAYKEY_VERSION}

