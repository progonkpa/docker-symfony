let {parallel, watch, src} = require('gulp');
let connect = require('gulp-connect');

function serverLivereload(cb) {
    connect.server({livereload: true});
    cb();
}

function watchTemplates(cb) {
    watch('src/Controller/**/*.php', {interval: 1000, usePolling: true}, reload);
    watch('templates/**/*.twig', {interval: 1000, usePolling: true}, reload);
    watch('public/css/**/*.css', {interval: 1000, usePolling: true}, reload);
    watch('public/js/**/*.js', {interval: 1000, usePolling: true}, reload);
    watch('assets/**/*.*', {interval: 1000, usePolling: true}, reload);
    cb()
}

function reload(cb) {
    // Point src() to 1 file to keep unnecessary file streaming overhead to a minimum.
    // I used connect.reload() directly but that wasn't working, any advice on losing the src().pipe() portion?
    src('public/index.php').pipe(connect.reload());
    cb();
}

exports.default = parallel(serverLivereload, watchTemplates);
