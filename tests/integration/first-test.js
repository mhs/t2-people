import Ember from "ember";
import { test } from 'ember-qunit';
import startApp from '../helpers/start-app';

var App;

module("Let's make it work", {
  setup: function() {
    App = startApp();
  },
  teardown: function() {
    Ember.run(App, App.destroy);
  }
});

test("It gets to the show page", function() {
  expect(1);
  visit('/people').then(function() {
    equal(find('.person-card').length, 2, "It has 2 people");
  });
});
