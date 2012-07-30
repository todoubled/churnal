util = require('util')
spawn = require('child_process').spawn

class GitLogger
  constructor: (@options, @callback) ->
    @diff()


  diff: ->
    dirs = @concatDirs()
    pipeline = @buildPipeline(dirs)
    @execute(pipeline)


  concatDirs: ->
    dirString = @options.paths.toString()
    dirString.replace(/,/g, ' -- ')


  # TODO: look into cut instead of awk
  buildPipeline: (dirs) ->
    "
    cd #{@options.repoPath};
    git checkout master;
    git pull --rebase;
    git log --since='#{@options.since || '1 week ago'}' --no-merges --pretty=oneline -- #{dirs} \
      | awk '{print $1}' \
      | xargs -I SHAs \
        git --no-pager show SHAs -- #{dirs}
    "

  execute: (pipeline) =>
    sh = spawn(pipeline)
    sh.on 'exit', @callback


module.exports = GitLogger
