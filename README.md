# Churnal

Email yourself a diff journal of the churn on specific file paths in your codebase from the last week.

## Usage

```
Churnal = require './churnal/index'

options =
  git:
    repoPath: '/path/to/repo'
    paths: [
      'app/models'
      'public/coffeescripts'
      'config/important.coffee'
    ]

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
