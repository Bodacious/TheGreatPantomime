gulp        = require "gulp"
changed     = require "gulp-changed"
slim        = require "gulp-slim"
runSequence = require "run-sequence"

gulp.task "watch", ->
  runSequence "clean", "build", ->
    gulp.watch("app/stylesheets/**/*{scss,sass}", ["styles"])
    gulp.watch("app/javascripts/**/*{coffee,js}", ["scripts"])
    gulp.watch("app/**/*.slim", ["slim"])