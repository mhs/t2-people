/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp({
  name: require('./package.json').name,
  getEnvJSON: require('./config/environment')
});

app.import('vendor/ember-data/ember-data.js');
app.import('vendor/moment/moment.js');

module.exports = app.toTree();
