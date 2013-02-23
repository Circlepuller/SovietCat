require 'js-yaml'
child_process = require 'child_process'
mongoose = require 'mongoose'
server = require './src/server/server'

module.exports = (grunt) ->
  # Make sure we can load the all-bearing configuration
  try
    config = require './config.yaml'

  catch e
    console.error "#{e.name}: #{e.message}"
    process.exit 1

  # Now for grunt initiation
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
          'public/partials/login.html': 'src/jade/partials/login.jade'
          'public/partials/test.html': 'src/jade/partials/test.jade'

    less:
      development:
        files:
          'public/css/sovietcat.css': [
            'src/less/bootstrap/bootstrap.less'
            'src/less/bootstrap/responsive.less'
          ]

      production:
        files:
          'public/css/sovietcat.min.css': [
            'src/less/bootstrap/bootstrap.less'
            'src/less/bootstrap/responsive.less'
          ]

        options:
          compress: true

    uglify:
      sovietcat:
        files:
          'public/js/sovietcat.min.js': [
            'public/js/bootstrap/bootstrap-collapse.js'
            'public/js/sovietcat.js'
          ]

        options:
          mangle: false

    reload:
      port: config.reload.port
      proxy:
        host: config.reload.proxy.host
        port: config.reload.proxy.port

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
    done = @async()

    config.__dirname = __dirname

    # Connect to MongoDB
    if config.db.username and config.db.password
      db = mongoose.createConnection "mongodb://#{config.db.username}:#{config.db.password}@#{config.db.host}:#{config.db.port}/#{config.db.database}"

    else
      db = mongoose.createConnection "mongodb://#{config.db.host}:#{config.db.port}/#{config.db.database}"

    [http, https] = server.createServer config, db

    grunt.log.writeln "Running server on port #{config.http.port} and SSL port #{config.https.port}"

    # Start the server for HTTP and HTTPS
    http.listen(config.http.port).on 'close', done
    https.listen(config.https.port).on 'close', done

  grunt.registerTask 'default', ['coffee', 'jade', 'less', 'uglify', 'reload', 'server', 'watch']
  grunt.registerTask 'compile', ['coffee', 'jade', 'less', 'uglify']