# Churnal

Email yourself a diff journal of the churn on specific file paths in your codebase.

## Usage

Give churnal a git script and some options (see ```examples/```) and it will email you the stdout.

```
Churnal = require './churnal/index'

options =
  script: "#{__dirname}/js-digest.sh"
  email:
    to:
      firstName: 'First'
      lastName: 'Last'
      email: 'email@gmail.com'
    from:
      name: 'Git log'
      service: 'Gmail'
      auth:
        user: 'email@gmail.com'
        pass: 'password'
    message: "Here's a diff of what's changed in the last week"
    subject: "Changes in the last week"


callback = (err, result) ->
  if err then throw err
  process.exit()

new Churnal(options, callback)
```
