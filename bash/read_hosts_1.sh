#!/bin/bash

ini_file="hosts"

section_name="$1"

awk -F "[][]" -v section="$section_name" '/\[.*\]/{sectionFound=($2 == section); next} sectionFound{if ($0) print "Host " ++host_count ": " $0}' "$ini_file"
