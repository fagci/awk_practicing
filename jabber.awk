function echo(m) {
    printf "[i] %s\n", m > "/dev/stderr"
}
function _send(m) {
    printf m
    fflush()
}
function send(m) {
    echo("OUT| " m)
    _send(m)
}
BEGIN{
    send("<stream:stream xmlns='jabber:client' to='jabber.ru' version='1.0' xmlns:stream='http://etherx.jabber.org/streams'>")
}

{echo("IN| " $0)}

/mechanisms/ {
    "printf '\\0%s\\0%s' '" user "' '" pass "' | base64" |& getline auth
    # FIXME: server not respond after that
    send("<auth xmlns='urn:ietf:params:xml:ns:xmpp-sasl' mechanism='PLAIN'>" auth "</auth>")
}
