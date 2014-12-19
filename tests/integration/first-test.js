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
  var testOffice = {id: 1,
                    name: "TestOffice",
                    project_ids: [1],
                    deleted: false}

  var testProject = {id: 1,
                     office_ids: [1],
                     vacation: false,
                     billable: true}

  var testPerson =  {id: 1,
                     name: 'Test Guy',
                     role: 'Developer',
                     email: 'testguy@example.com',
                     office_slug: 'testoffice'}


  setup: function() {
    App = startApp();
    fakeJson('/api/v1/offices', {offices: [testOffice]});
    fakeJson('/api/v1/projects', {projects: []});
    fakeJson('/api/v1/people', {people: []});

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
