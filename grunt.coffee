module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          "public/js/*.js": "src/coffee/**/*.coffee"

        options:
          flatten: false
          bare: false

    # This could be relatively interesting.
    handlebars:
      compile:
        files:
          "public/js/tmpl/*.js": "src/handlebars/**/*.hbs"

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
  
  grunt.registerTask "default", "coffee handlebars less reload watch"
