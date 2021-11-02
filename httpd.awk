#!/usr/bin/env -S awk -f

BEGIN {
    ORS = "\r\n"
    srv = "/inet/tcp/8080/0/0"

    html = "<h1>Hello, world!</h1>"
    clen = length(html)

    while(1) {
        srv |& getline
        if($1 == "GET") {
            print "HTTP/1.1 200 Okay, okay" |& srv
            print "Server: awk" |& srv
            print "Connection: close" |& srv
            print "Content-type: text/html" |& srv
            print "Content-length: " clen |& srv
            print ORS |& srv

            print html |& srv

            close(srv)
        }
    }
}
