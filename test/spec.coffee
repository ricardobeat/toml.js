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

it 'should work', ->

    assert.equal JSON.stringify(toml doc), JSON.stringify(expected)