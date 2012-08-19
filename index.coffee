cp = require 'child_process'
fs = require 'fs'
Emailer = require './lib/emailer'

sendEmail = (options, callback) -> new Emailer(options.email, callback)

module.exports = logStream = (options, callback) ->
  child = cp.spawn 'sh', ['-c', options.script]
  outputFilepath = "/tmp/#{new Date().toDateString().replace(/\s/g, '_')}.diff"
  stream = fs.createWriteStream outputFilepath

  child.stdout.pipe stream
  #child.stdout.pipe process.stderr
  child.on 'exit', (err, close) =>
    if err then throw err
    options.email.attachments = [ filePath: outputFilepath ]
    sendEmail options, callback
