import Ember from 'ember';
import config from './config/environment';

export default Ember.Router.extend({
  location: config.locationType
}).map(function() {
  this.route('sign_out');

  // People
  this.route('people');
  this.route('person-new', { path: '/people/new' });
  this.route('person', { path: '/people/:person_id' }, function() {
    this.route('edit');
  });

  // Projects
  this.route('projects');
  this.route('projects-new', { path: 'projects/new' });
  this.route('project',      { path: 'projects/:project_id' });
  this.route('project-edit', { path: 'projects/:project_id/edit' });
});
