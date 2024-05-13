language C

iab <buffer> <expr> td luaeval('require("rch.time").get_date("today")')
iab <buffer> <expr> tm luaeval('require("rch.time").get_date("tomorrow")')
iab <buffer> <expr> nw luaeval('require("rch.time").get_date("next_week")')

iab <buffer> <expr> t1 luaeval('require("rch.time").get_date("1")')
iab <buffer> <expr> t2 luaeval('require("rch.time").get_date("2")')
iab <buffer> <expr> t3 luaeval('require("rch.time").get_date("3")')
iab <buffer> <expr> t4 luaeval('require("rch.time").get_date("4")')
iab <buffer> <expr> t5 luaeval('require("rch.time").get_date("5")')

iab <buffer> <expr> LU luaeval('require("rch.time").get_date("monday")')
iab <buffer> <expr> MA luaeval('require("rch.time").get_date("tuesday")')
iab <buffer> <expr> ME luaeval('require("rch.time").get_date("wednesday")')
iab <buffer> <expr> JE luaeval('require("rch.time").get_date("thursday")')
iab <buffer> <expr> VE luaeval('require("rch.time").get_date("friday")')
iab <buffer> <expr> SA luaeval('require("rch.time").get_date("saturday")')
iab <buffer> <expr> DI luaeval('require("rch.time").get_date("sunday")')
