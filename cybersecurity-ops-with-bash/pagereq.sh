# Cybersecurity Ops with bash
# pagereq.sh
#
# Example:
#   bash pagereq.sh 127.0.0.1 < access.log | sort -rn | head -5

awk -v page="$1" '{ if ($1==page) {cnt[$7]+=1} }
END {
    for(id in cnt) {
        printf "%8d %s\n", cnt[id], id
    }
}
'