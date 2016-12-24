gulp            = require "gulp"
plugins         = require("gulp-load-plugins")
  DEBUG: false
  maintainScope: false
  pattern: ['gulp-*', 'gulp.*', 'main-bower-files'],
  replaceString: /\bgulp[\-.]/


# Compile SASS files
gulp.task "styles", ->
  cssFilter   = plugins.filter("**/*.{sass,css,scss}")
  localFilter = plugins.filter("app/stylesheets/*.sass", restore: true)
  sources     = plugins.mainBowerFiles().concat(["app/stylesheets/*.sass"])

  gulp.src(sources)
    .pipe(cssFilter)
    .pipe(plugins.changed("dist/css"))
    .pipe(plugins.sassGlob())
    .pipe(plugins.sass({
      # Sass options here...
    }).on('error', plugins.sass.logError))

    # Only our own assets...
    .pipe(localFilter)
      .pipe(plugins.autoprefixer())
      .pipe(localFilter.restore)

    .pipe(plugins.cssnano())
    .pipe(plugins.rename({
      basename: "application"
      extname: ".css"
    }))
    # Write output
    .pipe(gulp.dest("dist/css"))
