# Commands available from the diorama command
fs = require('fs')
templates = require('../lib/templates.coffee')

exports.help = ->
  console.log """
    Diorama usage:
      TODO - write this
  """

exports.new = (projectName) ->
  console.log "Creating a new project directory #{projectName}"
  fs.mkdir(projectName)

  console.log "Creating #{projectName}/controllers/"
  fs.mkdir("#{projectName}/controllers")

  console.log "Creating #{projectName}/models/"
  fs.mkdir("#{projectName}/models")

  console.log "Creating #{projectName}/collections/"
  fs.mkdir("#{projectName}/collections")

  console.log "Creating #{projectName}/views/"
  fs.mkdir("#{projectName}/views")

exports.scaffold = (modelName, fields...) ->
  unless isProjectDir()
    console.log "#{process.cwd()} does not appear to be a Backbone Diorama project"
    return false
  console.log "Generating scaffold for #{modelName}"

  console.log templates.model(name: modelName)

# Returns true if current working directory is a backbone diorama project
isProjectDir = () ->
  expectedDirs = ['controllers', 'models', 'collections', 'views'] 
  foundDirs = fs.readdirSync('.').filter((n) ->
    if(expectedDirs.indexOf(n) == -1)
        return false
    return true
  )
  foundDirs.length == 4
