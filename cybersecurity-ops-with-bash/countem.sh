# Cybersecurity Ops with bash
# countem.awk

awk '{ cnt[$1]++ }
END {
    for (id in cnt) {
        printf "%d %s\n", cnt[id], id
    }
}'