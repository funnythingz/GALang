module.exports = (grunt)->

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-typescript')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-gh-pages')
  grunt.loadNpmTasks('grunt-open')

  grunt.registerTask('build', ['clean', 'typescript', 'uglify', 'copy', 'compass'])
  grunt.registerTask('server', ['connect', 'open', 'watch'])
  grunt.registerTask('default', 'server')

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    uglify:
      dist:
        files: 'dist/app.min.js': ['dist/app.js']

    copy:
      html:
        files: [{
          expand: true
          cwd: 'src/html/'
          src: ['**/*.html']
          dest: 'dist/'
        }]

      assets:
        files: [{
          expand: true
          cwd: 'assets/imgs/'
          src: ['**/*.png', '**/*.jpg']
          dest: 'dist/imgs/'
        }]

      angular:
        files: [{
          expand: true
          cwd: 'bower_components/angular/'
          src: ['angular.min.js']
          dest: 'dist/js/'
        }]

    typescript:
      base:
        src: ['src/ts/**/*.ts']
        dest: 'dist/app.js'
        options:
          sourceMap: false

      test:
        src: ['tests/**/*.ts']
        dest: 'tests/test.js'
        options:
          sourceMap: false

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      typescript:
        files: ['src/ts/**/*.ts', 'tests/**/*.ts']
        tasks: ['typescript', 'uglify', 'copy']
        options:
          atBegin: true

      css:
        files: ['src/scss/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

      html:
        files: ['src/html/**/*.html']
        tasks: ['copy:html']
        options:
          atBegin: true

    clean: ['dist/*']

    open:
        dist:
            path: 'http://localhost:8000'

    connect:
        dist:
            options:
                port: 8000
                base: 'dist'
                livereload: true

  })
