#!/usr/bin/env -S awk -f

function send(text) {
    printf text "\r\n" |& conn
    fflush()
}

BEGIN {
    # host = "irc.libera.chat"
    host = "irc.rusnet.org.ru"
    port = 6660

    nick = "fagci-awk"

    conn = "/inet/tcp/0/" host "/" port

    send("NICK " nick)
    send("USER " nick " * " nick " :awk readonly bot")

    # send("LIST")

    # send("JOIN #neovim")
    # send("JOIN #networking")
    # send("JOIN #bash")

    send("JOIN #coding")
    send("JOIN #habrahabr")
    send("JOIN #durdom")

    while(conn |& getline) {
        if($1 == "PING") send("PONG " $2)
        if($2 == "PRIVMSG") print $0
        # print $0
    }

    close(hub)
}
