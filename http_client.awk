#!/usr/bin/env -S awk -f

BEGIN {
    RS = ORS = "\r\n"

    host = "www.urban-climate.net"
    path = "/content/images/Southwark_Files/Weather_Data_2017.csv"

    s = "/inet/tcp/0/" host "/80"

    print "GET " path " HTTP/1.1" |& s
    print "Host: " host |& s
    print "" |& s

    start = 0
    FS=","

    while((s |& getline) > 0) {
        if(start)
            print $1 " " $12
        else if($0 == "")
            start = 1
    }

    close(s)
}
