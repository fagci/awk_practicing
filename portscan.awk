#!/usr/bin/env -S awk -f

function check(host, port) {
    s = "/inet/tcp/0/" host "/" port

    PROCINFO[s, "READ_TIMEOUT"] = 500

    if(getline < s != -1 || ERRNO ~ /timed/) {
        print port, "open"
    }

    close(s)
}

BEGIN {
    host="192.168.0.200"
    for(port = 1; port < 1024; ++port) check(host, port)
}
