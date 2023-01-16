import std/[json, tables, strutils, re, sequtils]

proc loadLogkeys(): CountTable[char] =
    let f = open("logkeys.log")
    defer: f.close()
    var text: string

    for line in f.lines:
        if line.startsWith("Logging started at") or line.startsWith("Logging stopped at") or line.strip.len == 0:
            continue

        for c in line:
            if ($c).match(re"[a-z,\.\?\/;:]"):
                if c == ':':
                    text = text & ';'
                elif c == '?':
                    text = text & '/'
                else:
                    text = text & c

    result = toCountTable(text)


let keyOrdering = parseJson(readFile("key-ordering.json"));


var logkeys = loadLogkeys()
logkeys.sort()
let logkeysKeys = logkeys.keys().toSeq()
var orderedKeys = newSeq[string]()

for key in keyOrdering:
    let a = key.getInt()
    orderedKeys.add($logkeysKeys[a-1])

let w = open("output.json", fmWrite)
w.write(%orderedKeys)
w.close()
