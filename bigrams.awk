#!/usr/bin/env -S awk -f
BEGIN {FS="\\W+"}

{
    n = 2
    for(i=1; i<=NF; i++) {
        word = tolower($i)
        wlen = length(word)
        for(j=1; j<=wlen-n+1; ++j) {
            ng = substr(word, j, n)
            ngs[ng]++
        }
    }
}

END {
    PROCINFO["sorted_in"] = "@val_num_desc"
    for(ng in ngs) print ng
}
