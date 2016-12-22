gulp     = require("gulp")
coffee   = require("gulp-coffee")
changed  = require("gulp-changed")
uglify   = require "gulp-uglify"
gulpIf   = require "gulp-if"

# Compile coffee files
gulp.task "scripts", ->
  gulp.src('app/javascripts/*.{coffee,js}')
    .pipe(changed("dist/js"))
    .pipe(coffee())
    .pipe(gulpIf(gulp.env.production, uglify()))
    .pipe(gulp.dest("dist/js"))
