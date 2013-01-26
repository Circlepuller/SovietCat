module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          "public/js/modules/*.js": "src/coffee/**/*.coffee"

        options:
          flatten: false
          bare: false

    handlebars:
      compile:
        files: // I don't know what to put here D:

    less:
      development:
        files:
          "public/css/*.css": "src/less/*.less"

        options:
          compress: true

      production:
        files:
          "public/css/*.css": "src/less/*.less"

        options:
          compress: true

    reload:
      port: 80
      proxy:
        host: "localhost"
        port: 8000

    watch:
      coffee:
        files: ["src/coffee/**/*.coffee"]
        tasks: ["coffee", "reload"]
        
      handlebars:
        files: ["src/handlebars/*.hbs"]
        tasks: ["handlebars", "reload"]
        
      less:
        files: ["src/less/*.less"]
        tasks: ["less", "reload"]

  grunt.loadNpmTasks "grunt-reload"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-handlebars"
  grunt.loadNpmTasks "grunt-contrib-less"