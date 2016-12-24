gulp     = require("gulp")
plugins         = require("gulp-load-plugins")
  DEBUG: false
  maintainScope: false
  pattern: ['gulp-*', 'gulp.*', 'main-bower-files'],
  replaceString: /\bgulp[\-.]/

# Copy image files over to dist
gulp.task "images", ->
  gulp.src('app/images/*.{gif,jpg,jpeg,png}')
    .pipe(plugins.changed("dist/images"))
    .pipe(plugins.imagemin())
    .pipe(gulp.dest("dist/images"))
