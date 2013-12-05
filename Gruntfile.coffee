module.exports = (grunt) ->

  grunt.initConfig

    coffee:
      options:
        sourceMap: true
      compile:
        expand: true
        cwd: 'src/coffeescript'
        src: ['**/*.coffee']
        dest: 'src/javascript/'
        ext: '.js'

    requirejs:
      optimize:
        options:
          name: 'main'
          baseUrl: 'src/javascript/main'
          out: 'public/js/inversion.js'
          generateSourceMaps: true
          preserveLicenseComments: false
          optimize: 'uglify2'

    # uglify:
    #   minify:
    #     files:
    #       'public/js/inversion.min.js': 'public/js/inversion.js'

    mocha:
      test:
        src: ['test.html']

    watch:
      files: ['src/**/*.coffee']
      tasks: 'build'


    grunt.loadNpmTasks "grunt-contrib-coffee"
    # grunt.loadNpmTasks "grunt-contrib-uglify"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-requirejs"
    grunt.loadNpmTasks "grunt-mocha"
    grunt.loadNpmTasks "grunt-notify"

    grunt.registerTask 'default', ['watch']
    grunt.registerTask 'build', ['coffee', 'requirejs']
    grunt.registerTask 'test', ['mocha']