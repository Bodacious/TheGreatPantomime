gulp       = require "gulp"
awspublish = require 'gulp-awspublish'
AWS        = require "aws-sdk"
env        = require "./environment"

gulp.task 'publish', ->

  # create a new publisher using S3 options
  # http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#constructor-property
  publisher = awspublish.create
    region: env("AWS_REGION")
    accessKeyId:     env("ACCESS_KEY_ID")
    secretAccessKey: env("SECRET_ACCESS_KEY")
    params: {
      Bucket: env("AWS_BUCKET_NAME")
    }
    # credentials: new AWS.SharedIniFileCredentials({profile: 'great-pantomime'})

  # define custom headers
  headers = {
    'Cache-Control': 'max-age=315360000, no-transform, public'
  }

  gulp.src('dist/**/*')
    # gzip, Set Content-Encoding headers and add .gz extension
    .pipe(awspublish.gzip({ ext: '.gz' }))

    # publisher will add Content-Length, Content-Type and headers specified above
    # If not specified it will set x-amz-acl to public-read by default
    .pipe(publisher.publish(headers))

    # create a cache file to speed up consecutive uploads
    # .pipe(publisher.cache())

     # print upload updates to console
    .pipe(awspublish.reporter())
