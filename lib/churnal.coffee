GitLogger = require('./gitlogger')
Emailer = require('./emailer')
exec = require('child_process').exec
fs = require('fs')


class Churnal
  constructor: (@options, @callback) ->
    @gitLog()


  gitLog: ->
    new GitLogger(@options.git, @writeFile)


  sendEmail: (filePath) =>
    @options.email.attachments = [ filePath: filePath ]
    new Emailer(@options.email, @callback)


  writeFile: (diff) =>
    filePath = "/tmp/#{new Date().toDateString().replace(/\s/g, '_')}.diff"
    fs.writeFile filePath, diff, (err) =>
      if err then throw err
      else @sendEmail(filePath)



module.exports = Churnal
