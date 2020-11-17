#!/bin/sh 
java -jar /home/depends/depends.jar $@ depends

OUTPUT=./depends.json

if [ -f "$FILE" ]; then
	chmod 644 depends.json
	depends=$(cat depends.json)
	echo "::set-output name=depends::$depends"
else
	echo "::set-output name=depends::[]"
fi
