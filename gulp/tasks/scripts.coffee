gulp            = require "gulp"
plugins         = require("gulp-load-plugins")
  DEBUG: false
  maintainScope: false
  pattern: ['gulp-*', 'gulp.*', 'main-bower-files'],
  replaceString: /\bgulp[\-.]/

browserify = require('browserify')
env = require "./environment"

# Basic usage
gulp.task 'scripts', ->
  files        = "app/javascripts/**/*.{coffee,js}"
  coffeeFilter = plugins.filter("**/*.coffee", restore: true)
  sources      = plugins.mainBowerFiles().concat(files)

  gulp.src(sources)
    .pipe(plugins.filter("**/*.{js,coffee}"))
    .pipe(plugins.debug({title: 'Coffee:'}))
    .pipe(coffeeFilter)
      .pipe(plugins.coffeeify())
      .pipe(coffeeFilter.restore)

    .pipe(plugins.concat("application.js"))
    # OUTPUT:
    .pipe(gulp.dest('dist/js'))
