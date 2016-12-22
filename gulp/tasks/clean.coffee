gulp = require('gulp')
del  = require("del")

gulp.task "clean", ->
  del.sync("dist")
