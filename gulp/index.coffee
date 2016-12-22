fs   = require 'fs'
path = require "path"

onlyScripts = scriptFilter = (name) ->
  /(\.(js|coffee)$)/i.test(path.extname(name))

tasks = fs.readdirSync('./gulp/tasks/').filter(onlyScripts)

tasks.forEach (task) ->
  require("./tasks/#{task}")