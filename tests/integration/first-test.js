import Ember from "ember";
import { test } from 'ember-qunit';
import startApp from '../helpers/start-app';

var App;
var server = sinon.fakeServer.create();
server.autoRespond = true;

var fakeJson = function(route, content) {
  server.respondWith('GET', route,
                     [200,
                       {'Content-Type': 'application/json'},
                       JSON.stringify(content)]);
};

module("Let's make it work", {
  setup: function() {
    App = startApp();
    fakeJson('/api/v1/offices', {offices: []});
    fakeJson('/api/v1/people', {people: []});
    fakeJson('/api/v1/projects', {projects: []});

  },
  teardown: function() {
    Ember.run(App, App.destroy);
    server.restore();
  }
});

test("It gets to the show page", function() {
  expect(1);
  visit('/people').then(function() {
    equal(find('.person-card').length, 2, "It has 2 people");
  });
});
