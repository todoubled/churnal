emailer = require 'nodemailer'

class Emailer
  constructor: (@email, @callback) ->
    @send()


  send: ->
    transport = @getTransport()
    data =
      to: "'#{@email.to.firstName} #{@email.to.lastName}' <#{@email.to.email}>"
      from: @email.from.name
      subject: @email.subject
      html: @email.message
      attachments: @email.attachments

    callback = (err, result) =>
      transport.close()
      @callback(err, result)

    transport.sendMail data, callback


  getTransport: ->
    emailer.createTransport 'SMTP',
      service: @email.from.service
      auth:
        user: @email.from.auth.user
        pass: @email.from.auth.pass


module.exports = Emailer
