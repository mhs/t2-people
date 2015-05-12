import Ember from 'ember';
import config from './config/environment';

export default Ember.Router.extend({
  location: config.locationType
}).map(function() {
  this.route('sign_out');

  // People
  this.resource('people');
  this.route('people.new', { path: '/people/new' });
  this.resource('person', { path: '/people/:person_id' }, function() {
    this.route('edit');
  });

  // Projects
  this.resource('projects');
  this.resource('projects-new', { path: 'projects/new' });
  this.resource('project',      { path: 'projects/:project_id' });
  this.resource('project-edit', { path: 'projects/:project_id/edit' });
});
