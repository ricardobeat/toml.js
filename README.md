TOML.js
=======

Javascript implementation of a [TOML](https://github.com/mojombo/toml) parser.

### What is TOML?

TOML is the drunken brainchild of Tom Prestom-Werner, a INI-inspired minimal alternative to YAML for configuration files.

    # This is a TOML document. Boom.

    title = "TOML Example"

    [owner]
    name = "Tom Preston-Werner"
    organization = "GitHub"
    bio = "GitHub Cofounder & CEO\nLikes tater tots and beer."
    dob = 1979-05-27T07:32:00Z # First class dates? Why not?

This becomes the object:

    {
        title: "TOML Example",
        owner: {
            name: "Tom Preston-Werner",
            bio: "Github Cofounder & CEO\nLikes tater tots and beer.",
            dob: [object Date]
        }
    }

Values are interpreted as `String`, `Number`, `Date`, `Array` and `Object` instances.

### Install

    npm install tomljs

### Use

    var fs   = require('fs')
      , toml = require('toml2')
      , file = fs.readFileSync('config.toml').toString()

    var config = toml(file)

### Build

    git clone https://github.com/ricardobeat/toml.git
    npm install
    npm run-script watch

See `Cakefile` for the build/watch tasks.

### Test

Run `npm test` or `mocha` on the root folder.
