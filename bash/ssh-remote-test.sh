#!/bin/bash

COMMAND="cd /tmp && sudo touch testfile"

while IFS= read -r SERVER; do
	ssh "$SERVER" "$COMMAND"
	if [ $? -eq 0 ]; then
		echo "execute $SERVER completed."
	else
		echo "execute $SERVER failed."
	fi
done < server.list
