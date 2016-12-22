gulp        = require "gulp"
sass        = require "gulp-sass"
autoprefixer = require "gulp-autoprefixer"
changed     = require "gulp-changed"
cssnano     = require "gulp-cssnano"
gulpIf      = require "gulp-if"
register    = require "register"
rename      = require "gulp-rename"
sassGlob    = require 'gulp-sass-glob'

# Compile SASS files
gulp.task "styles", ->
  gulp.src("app/stylesheets/*.{css,scss,sass}")
    .pipe(changed("dist/css"))
    .pipe(sassGlob())
    .pipe(sass())
    .pipe(autoprefixer())
    .pipe(gulpIf(gulp.env.production, cssnano()))
    .pipe(rename({
      basename: "application"
      extname: ".css"
    }))
    .pipe(gulp.dest("dist/css"))
