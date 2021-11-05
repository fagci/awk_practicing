#!/usr/bin/env -S awk -f
#Plot bars for du

BEGIN {
    total = 0
    max = 0
}

{
    total += $1
    st[$2] = $1
    if(max<$1) max = $1
}

END {
    _w = w?w:45
    for(d in st) {
        v = st[d]*(_w - 10)/max
        print d
        printf "%9d ", st[d]
        for(i = 0; i < v; i++) printf "#"
        print ""
    }
}
