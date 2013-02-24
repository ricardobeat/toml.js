flour = require 'flour'

flour.minifiers.js = null

task 'build', ->
    compile '*.coffee', '*'

task 'watch', ->
    invoke 'build'
    watch '*.coffee', -> invoke 'build'