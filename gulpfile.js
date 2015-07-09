var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var react = require('gulp-react');
var sh = require('shelljs');
var jshint = require('gulp-jshint');
var scsslint = require('gulp-scss-lint');

scsslint({
    'config': '.scss-lint.yml',
});

var paths = {
  sass: ['./scss/**/*.scss'],
  jsx: ['./jsx/**/*.jsx'],
  js: ['./www/js/**/*.js'],
};

gulp.task('default', ['react', 'sass']);

gulp.task('js-lint', function() {
  return gulp.src(paths.js)
    .pipe(jshint())
    .pipe(jshint.reporter('default'));
});

gulp.task('scss-lint', function() {
  gulp.src(paths.sass)
    .pipe(scsslint());
});

gulp.task('sass', function(done) {
  gulp.src(paths.sass)
    .pipe(sass({
      errLogToConsole: true
    }))
    .pipe(gulp.dest('./www/css/'))
    .pipe(minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(rename({ extname: '.min.css' }))
    .pipe(gulp.dest('./www/css/'))
    .on('end', done);
});

gulp.task('react', function(done) {
  gulp.src(paths.jsx)
    .pipe(react())
    .pipe(rename({ extname: '.js' }))
    .pipe(gulp.dest('./www/js/'))
    .on('end', done);
});

gulp.task('watch', function() {
  gulp.watch(paths.sass, ['scss-lint', 'sass']);
  gulp.watch(paths.jsx, ['react']);
  gulp.watch(paths.js, ['js-lint']);
});

gulp.task('install', ['git-check'], function() {
  return bower.commands.install()
    .on('log', function(data) {
      gutil.log('bower', gutil.colors.cyan(data.id), data.message);
    });
});

gulp.task('git-check', function(done) {
  if (!sh.which('git')) {
    console.log(
      '  ' + gutil.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
    );
    process.exit(1);
  }
  done();
});
