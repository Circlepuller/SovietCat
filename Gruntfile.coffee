child_process = require 'child_process'

module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'public/js/sovietcat.js': 'src/coffee/**/*.coffee'

        options:
          bare: true # This is causing serious issues when set to "false"

    jade:
      compile:
        files:
          'public/index.html': 'src/jade/index.jade'
          'public/partials/test.html': 'src/jade/partials/test.jade'

    less:
      development:
        files:
          'public/css/sovietcat.css': 'src/less/**/*.less'

      production:
        files:
          'public/css/sovietcat.min.css': 'src/less/**/*.less'

        options:
          compress: true

    uglify:
      sovietcat:
        files:
          'public/js/sovietcat.min.js': ['public/js/sovietcat.js']

    reload:
      port: 6001
      proxy:
        host: 'localhost'
        port: 8001

    watch:
      coffee:
        files: ['src/coffee/**/*.coffee']
        tasks: ['coffee', 'reload']

      jade:
        files: ['src/jade/**/*.jade']
        tasks: ['jade', 'reload']

      less:
        files: ['src/less/**/*.less']
        tasks: ['less', 'reload']

      uglify:
        files: ['public/js/**/*.js']
        tasks: ['uglify', 'reload']

      server:
        files: ['src/server/**/*.coffee']
        tasks: ['server']

  grunt.loadNpmTasks 'grunt-reload'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'server', () ->
    execServer = () ->
      exec = 'node_modules/coffee-script/bin/coffee'
      exec = "#{__dirname}/#{exec}.cmd" if process.platform is 'win32'

      serverProc = child_process.spawn exec, ['runserver.coffee'],
        stdio: 'inherit'

      if serverProc?
        console.log 'Trying to kill old server...'
        serverProc.on 'close', execServer
        serverProc.kill()

      else
        execServer()

  grunt.registerTask 'default', ['coffee', 'jade', 'less', 'uglify', 'reload', 'server', 'watch']
  grunt.registerTask 'compile', ['coffee', 'jade', 'less', 'uglify']