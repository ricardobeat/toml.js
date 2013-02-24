fs     = require 'fs'
assert = require 'assert'

toml = require '../'

doc = fs.readFileSync('./test/test.toml').toString()

expected =
    title: "TOML Example"
    owner:
        name: "Tom Preston-Werner"
        organization: "GitHub"
        bio: "GitHub Cofounder & CEO\nLikes tater tots and beer."
        dob: new Date('1979-05-27T07:32:00Z')
    database:
        server: "192.168.1.1"
        ports: [ 8001, 8001, 8002 ]
        names: [ "a", "b", "c" ]
        connection_max: 5000
        enabled: true
    servers:
        alpha:
            ip: "10.0.0.1"
            dc: "eqdc10"
        beta:
            ip: "10.0.0.2"
            dc: "eqdc10"
            hyper: long: nested: stuff: false: false
    numbers:
        mi_nus: -10
        float: 0.877
        log: -1.374
    multiline:
        string: "this is a \nmultiline string"
        array: [1,2,3]
        array2: [1,2,3,4,5,6]
    nested:
        a: [[1,2], [3,4]]
        b: [
            ["a", "b", "c"]
            [true, false]
            [[1], [2]]
        ]

it 'should work', ->

    res = toml doc
    assert.equal JSON.stringify(res), JSON.stringify(expected)

it 'should always work', ->

    assert.deepEqual toml("hello = 1\noi=true"), { hello: 1, oi: true }
