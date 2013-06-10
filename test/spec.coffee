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
            country: "中国"
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
    escaped:
        string: "I'm a string. \"You can quote me\". Tab \t newline \n you get it."
    the:
        test_string: "You'll hate me after this - #"
        hard:
            test_array: [ "] ", " # "]
            test_array2: [ "Test #11 ]proved that", "Experiment #9 was a success" ]
            another_test_string: " Same thing, but with a string #"
            harder_test_string: " And when \"'s are in the string, along with # \""
            'bit#':
                "what?": "You don't think some user won't do that?"
                multi_line_array: ["]"]

it.only 'should work', ->

    res = toml doc
    assert.equal JSON.stringify(res), JSON.stringify(expected)

it 'should always work', ->

    assert.deepEqual toml("hello = 1\noi=true"), { hello: 1, oi: true }
