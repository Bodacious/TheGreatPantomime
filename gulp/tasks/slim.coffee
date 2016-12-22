gulp        = require "gulp"
changed     = require "gulp-changed"
slim        = require "gulp-slim"

# Compile Slim files
gulp.task "slim",  ->
  gulp.src("app/**/*.slim")
    .pipe(changed("dist"))
    .pipe(slim(
      pretty: !gulp.env.production
      require: 'slim/include'
      options: 'include_dirs=["./app"]'
    ))
    .pipe(gulp.dest("dist"))
