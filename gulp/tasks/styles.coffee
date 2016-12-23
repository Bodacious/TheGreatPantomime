gulp            = require "gulp"
# sass            = require "gulp-sass"
# autoprefixer    = require "gulp-autoprefixer"
# mainBowerFiles  = require "main-bower-files"
# changed         = require "gulp-changed"
# cssnano         = require "gulp-cssnano"
# gulpIf          = require "gulp-if"
# register        = require "register"
# rename          = require "gulp-rename"
# sassGlob        = require 'gulp-sass-glob'
# filter          = require "gulp-filter"
plugins         = require("gulp-load-plugins")({
  DEBUG: false
  maintainScope: false
  pattern: ['gulp-*', 'gulp.*', 'main-bower-files'],
  replaceString: /\bgulp[\-.]/
})

# Compile SASS files
gulp.task "styles", ->
  cssFiles = ["app/stylesheets/application.sass"]
  gulp.src(plugins.mainBowerFiles().concat(cssFiles))
    .pipe(plugins.filter('*.css'))
    .pipe(plugins.sassGlob())
    .pipe(plugins.sass())
    .pipe(plugins.autoprefixer())
    .pipe(plugins.if(gulp.env.production, plugins.cssnano()))
    .pipe(plugins.rename({
      basename: "application"
      extname: ".css"
    }))
    .pipe(gulp.dest("dist/css"));

  # gulp.src(plugins.filter('*.css'))
  #   .pipe(changed("dist/css"))
  #   .pipe(sassGlob())
  #   .pipe(sass())
  #   .pipe(autoprefixer())
  #   .pipe(gulpIf(gulp.env.production, cssnano()))
  #   .pipe(rename({
  #     basename: "application"
  #     extname: ".css"
  #   }))
  #   .pipe(gulp.dest("dist/css"))
