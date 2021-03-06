churnal = require '../index'

options =
  script: "#{__dirname}/scripts/js-what-changed.sh"
  email:
    to:
      firstName: 'Front End'
      lastName: 'Team'
      email: process.env.TO_EMAIL
    from:
      name: 'Git Log'
      service: 'Gmail'
      auth:
        user: process.env.GMAIL_USER
        pass: process.env.GMAIL_PASSWORD
    message: "Here's a diff of CoffeeScript and Configuration changed in the last week"
    subject: "Churnal: What Changed"


churnal options, (err, result) ->
  if err then throw err
  process.exit()
