###
Exports an object that defines
 all of the configuration needed by the projects'
 depended-on grunt tasks.

You can find the parent object in: node_modules/lineman/config/application.js
###

module.exports = require(process.env['LINEMAN_MAIN']).config.extend 'application',
  # Override application configuration here. Common examples follow in the comments.

  #  API Proxying
  #
  #  During development, you'll likely want to make XHR (AJAX) requests to an API on the same
  #  port as your lineman development server. By enabling the API proxy and setting the port, all
  #  requests for paths that don't match a static asset in ./generated will be forwarded to
  #  whatever service might be running on the specified port.
  #
  #  server: {
  #    apiProxy: {
  #      enabled: true,
  #      host: 'localhost',
  #      port: 3000
  #    }
  #  }

  enableSass: true
  prependTasks:
    common: ["ember_handlebars", "env"]

  removeTasks:
    common: "handlebars"

  loadNpmTasks: ['grunt-ember-handlebars']

  ember_handlebars:
    options:
      processName: (name) -> name.match(/app\/templates\/([^.]*)/)[1]
    compile:
      files:
        "generated/template/handlebars.js": "<%= files.template.handlebars %>"

  env:
    config:
      env: process.env['APP_ENV'] || "dev"
      apiHost: process.env['API_HOST'] || "http://localhost:5000"
      navBarUrl: process.env['NAVBAR_URL'] || "/api/v1/navbar"
      oauthKey: process.env['OAUTH_KEY'] || "de92924d00c19567c3566d17fe2e783666fd05bcecea385b508b4a3e393dd204"

  watch:
    handlebars:
      tasks: ["ember_handlebars:compile", "concat:js"]

  concat:
    js:
      src: ["<banner:meta.banner>", "<%= files.js.vendor %>", 'generated/js/env.js', "<%= files.template.generated %>", "<%= files.coffee.generated %>", "<%= files.js.app %>"]

  server:
    web:
      port: 9999
