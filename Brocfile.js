/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var fileMover = require('broccoli-file-mover');

var vendorTree = fileMover('vendor', {
  files: {
    'ember/index.js': 'ember/ember.js',
    'ember-prod/index.js': 'ember/ember.prod.js'
  }
});

var app = new EmberApp({
  name: require('./package.json').name,
  trees: {
    vendor: vendorTree
  },
  getEnvJSON: require('./config/environment')
});

app.import('vendor/ember-data/ember-data.js');
app.import('vendor/moment/moment.js');

module.exports = app.toTree();
