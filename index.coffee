cp = require 'child_process'
fs = require 'fs'
email = require './lib/emailer'

module.exports = gitLogStream = (options, callback) ->
  throw 'churnalOptions.email.to.email must be defined' unless options.email.to.email?
  throw 'churnalOptions.email.from.auth.user must be defined' unless options.email.from.auth.user?
  throw 'churnalOptions.email.from.auth.pass must be defined' unless options.email.from.auth.pass?
  child = cp.spawn 'sh', ['-c', options.script]
  outputFilepath = "/tmp/#{new Date().toDateString().replace(/\s/g, '_')}.diff"
  stream = fs.createWriteStream outputFilepath
  child.stdout.pipe stream
  child.on 'exit', (err) =>
    if err then throw err
    options.email.attachments = [ filePath: outputFilepath ]
    email options.email, callback
