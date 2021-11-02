#!/usr/bin/env -S awk -f

BEGINFILE {
    PROCINFO["sorted_in"] = "@ind_str_asc"
    print FILENAME ":"
    print ""
    delete stats
    delete paths
}

/GET/ {
    stats[$9]++
    paths[$9":"$7]++
}

ENDFILE {
    for(code in stats) {
        print "["code"]", stats[code]
        for(path in paths) print "  " substr(path, 5)
        print "  "
    }
}
