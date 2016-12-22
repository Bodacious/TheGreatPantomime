gulp     = require("gulp")
changed  = require "gulp-changed"

# Copy image files over to dist
gulp.task "images", ->
  gulp.src('app/images/*.{gif,jpg,jpeg,png}')
    .pipe(changed("dist/images"))
    .pipe(gulp.dest("dist/images"))
