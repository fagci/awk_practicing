function echo(msg) {
    printf "[i] %s\n", msg > "/dev/stderr"
}

function _send(msg) {
    printf "%s\r\n", msg
    fflush()
}

function send(msg) {
    echo(msg)
    _send(msg)
}

BEGIN {
    send("NICK awktest")
    send("USER awktest * awktest awktest")
}

{ echo($0) }

$2 == "PING" {send("PONG " $2)}

# MOTD end
$2 == "376" {
    send("JOIN #bash")
    send("JOIN #networking")
}


