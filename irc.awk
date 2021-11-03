#!/usr/bin/env -S awk -f

function send(text) {
    printf text "\r\n" |& conn
}

BEGIN {
    host = "irc.libera.chat"
    port = 6667

    nick = "fagci-awk-logger"

    conn = "/inet/tcp/0/" host "/" port

    send("NICK " nick)
    send("USER " nick " * " nick " " nick)
    send("JOIN #neovim")
    send("JOIN #networking")
    send("JOIN #bash")

    while(conn |& getline) {
        if($1 == "PING") send("PONG " $2)
        if($2 == "PRIVMSG") {
            for(i=3; i<=NF; ++i) printf $i FS
            print ""
        }
    }

    close(hub)
}
