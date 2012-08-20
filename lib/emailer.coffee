emailer = require 'nodemailer'

getTransport = (options) ->
  emailer.createTransport 'SMTP',
    service: options.from.service
    auth:
      user: options.from.auth.user
      pass: options.from.auth.pass

module.exports = email = (options, callback) ->
  transport = getTransport options
  data =
    to: "'#{options.to.firstName} #{options.to.lastName}' <#{options.to.email}>"
    from: options.from.name
    subject: options.subject
    html: options.message
    attachments: options.attachments

  cb = (err, result) ->
    transport.close()
    callback err, result

  transport.sendMail data, cb
