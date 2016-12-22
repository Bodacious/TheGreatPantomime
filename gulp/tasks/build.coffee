gulp        = require "gulp"
runSequence = require "run-sequence"

gulp.task "build", ['clean'], (callback) ->
  runSequence('slim', 'styles', 'scripts', "images", callback)

