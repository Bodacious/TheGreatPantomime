gulp = require "gulp"
yaml = require('js-yaml');
fs   = require('fs');


module.exports = (arg) ->
  env  = {}
  # Get document, or throw exception on error
  try
    doc = yaml.safeLoad(fs.readFileSync('./config/application.yml', 'utf8'))
    env[key] = value for key, value of doc
  catch e
    console.log(e)
  if arg
    return env[arg]
  else
    return env