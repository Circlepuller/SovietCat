# child_process = require 'child_process'

module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'public/js/*.js': 'src/coffee/**/*.coffee'
        options:
          flatten: false
          bare: false

    handlebars_requirejs:
      basic:
        files:
          'public/js/tmpl/': 'src/handlebars/**/*.hbs'

    less:
      development:
        files:
          'public/css/*.css': 'src/less/*.less'

        options:
          compress: true

      production:
        files:
          'public/css/*.css': 'src/less/*.less'

        options:
          compress: true

    reload:
      port: 6001
      proxy:
        host: 'localhost'
        port: 8001

    server:
      port: 8001
      base: 'public'

    watch:
      coffee:
        files: ['src/coffee/**/*.coffee']
        tasks: ['coffee', 'reload']

      handlebars:
        files: ['src/handlebars/**/*.hbs']
        tasks: ['handlebars', 'reload']

      less:
        files: ['src/less/*.less']
        tasks: ['less', 'reload']

      server:
        files: ['src/server/*.coffee']
        tasks: ['server']

  grunt.loadNpmTasks 'grunt-reload'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-handlebars-requirejs'

  # grunt.registerTask 'server', () ->
  #   execServer = () ->
  #     exec = 'node_modules/coffee-script/bin/coffee'
  #     exec = __dirname + '/node_modules/.bin/coffee.cmd' if process.platform is 'win32'

  #     serverProc = child_process.spawn exec, ['runserver.coffee'],
  #       stdio: 'inherit'

  #     if serverProc?
  #       console.log 'Trying to kill old server...'
  #       serverProc.on 'close', execServer
  #       serverProc.kill()

  #     else
  #       execServer()

  grunt.registerTask 'default', 'coffee handlebars_requirejs less reload server watch'
  grunt.registerTask 'compile', 'coffee handlebars_requirejs less'