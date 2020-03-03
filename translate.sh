#!/bin/bash
SOURCE_FILE=$1
TARGET=$2
mkdir -p public/$TARGET
AUTHORIZATION="Authorization: Bearer "$(GOOGLE_APPLICATION_CREDENTIALS=gcc-credentials.json gcloud auth application-default print-access-token)
BODY=$(echo "{\"contents\": [], \"mimeType\": \"text/html\", \"sourceLanguageCode\": \"en-CA\", \"targetLanguageCode\": \"$TARGET\"}" | jq -M ".contents = [$(cat public/$SOURCE_FILE | jq -RceMs)]")
URL="https://translation.googleapis.com/v3/projects/$(cat gcc-credentials.json| jq -cr '.project_id')/locations/global:translateText"
RESPONSE=$(curl -s -X POST -H "$AUTHORIZATION" -H "Content-Type: application/json; charset=utf-8" -d "$BODY" "$URL")
TRANSLATION=$(echo "$RESPONSE" | jq -rM ".translations[0].translatedText")
# attempt to add an HTML Lang attribute, but sometimes it just gives `null` files
#HTML=$(echo $TRANSLATION | sed -e "s/<html>/<html lang=$TARGET>/g")
#echo $HTML > public/$TARGET/$SOURCE_FILE
echo $TRANSLATION > public/$TARGET/$SOURCE_FILE