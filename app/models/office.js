import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  projects: DS.hasMany('project'),

  deleted: DS.attr('boolean'),
  name: DS.attr('string'),

  slug: function() {
    return this.get('name').replace(/\s+/, '-').toLowerCase();
  }.property('name'),

  value: Ember.computed.alias('id')
});
