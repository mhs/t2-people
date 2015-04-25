import Ember from 'ember';
import config from './config/environment';

export default Ember.Router.extend({
  location: config.locationType
}).map(function() {
  this.route('sign_out');

  this.resource('people');
  this.route('people.new', { path: '/people/new' });

  this.resource('person', { path: '/people/:person_id' }, function() {
    this.route('edit');
  });
});
