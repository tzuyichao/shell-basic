#!/bin/bash

if [ "$#" -ne 4 ]; then
	echo "Usage: $0 <ini file> <section name> <ssh user> <command>"
	exit 1
fi

ini_file="${1}"
section_name="${2}"
ssh_user="${3}"
command_to_execute="${4}"

if [ ! -f "$ini_file" ]; then
	echo "ini file not found: $ini_file"
	exit 1
fi

servers=$(awk -F '[][]' -v section="$section_name" '/\[.*\]/{section_found=($2 == section); next} section_found{if ($0) print $0}' "$ini_file")

for server in $servers; do
	echo "Connect to $server..."
	ssh "$ssh_user@$server" "$command_to_execute"
done

echo "Command execution completed."
