#!/usr/bin/env -S awk -f
BEGIN {
    for(n = 102; n <= 987; ++n) {
        split(n, p, "")
        if(p[1] == p[2] || p[2] == p[3] || p[1] == p[3]) continue
        if((p[1] + p[2] + p[3])^3 == n) {
            print "("p[1]"+"p[2]"+"p[3]")^3="n
        }
    }
}

