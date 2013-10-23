module.exports = function (grunt) {

  /* Loads npm tasks.
     Add or remove packages from `package.json`*/
  grunt.loadNpmTasks('grunt-contrib-requirejs');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-ember-templates');

  /* Main configuration object.
     Each Grunt plugin has its format.
     Check each's plugin github for more info. */
  grunt.initConfig({

    connect: {
      server: {
        options: {
          port: 9999,
          host: '0.0.0.0'
        }
      }
    },

    requirejs: {
      compile: {
        options: {
          baseUrl: './app/js',
          out: './app/application.min.js',
          name: 'router'
        }
      }
    },

    less: {
      compile: {
        files: {
          './app/application.css': './app/less/application.less'
        }
      }
    },

    emberTemplates: {
      compile: {
        options: {
          templateName: function (filename) {
            return filename.replace(/.\/app\/html\/(.*?).html/, '$1');
          }
        },
        files: {
          './app/templates.min.js': ['./app/html/**/*.html']
        }
      }
    },

    watch: {
      javascript: {
        files: ['app/js/**/*.js'],
        tasks: ['requirejs'],
        options: {
          livereload: true
        }
      },
      less: {
        files: ['app/less/**/*.less'],
        tasks: ['less'],
        options: {
          livereload: true
        }
      },
      html: {
        files: ['app/html/**/*.html'],
        tasks: ['emberTemplates'],
        options: {
          livereload: true
        }
      }
    }

  });

  grunt.registerTask('default', ['requirejs', 'less', 'emberTemplates', 'connect', 'watch']);

  grunt.registerTask('heroku', ['requirejs', 'less', 'emberTemplates']);

};
