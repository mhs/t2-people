import Ember from 'ember';
import DS from 'ember-data';
import DateTransform from 't2-people/transforms/date';

let attr = DS.attr;

export default DS.Model.extend({
  currentAllocations: DS.hasMany('allocation'),
  office: DS.belongsTo('office'),

  avatar: attr('raw'),
  bio: attr('string'),
  email: attr('string'),
  end_date: attr('date'),
  github: attr('string'),
  name: attr('string'),
  notes: attr('string'),
  office_slug: attr('string'),
  percentBillable: DS.attr('number'),
  role: attr('string'),
  start_date: attr('date'),
  title: attr('string'),
  twitter: attr('string'),
  website: attr('string'),

  firstName: function() {
    return this.get('name').split(' ')[0];
  }.property('name'),

  mailTo: function() {
    return "mailto:" + this.get('email');
  }.property('email'),

  twitterURL: function() {
    return "https://twitter.com/" + this.get('twitter');
  }.property('twitter'),

  githubURL: function() {
    return "https://github.com/" + this.get('github');
  }.property('github'),

  avatarFile: null,

  unsellable: Ember.computed.equal('percentBillable', 0),

  allocated: Ember.computed.gt('currentAllocations.length', 0),

  formStartDate: function(k, v) {
    if (arguments.length > 1) {
      this.set('start_date', this.deserializeDate(v));
    }
    return this.serializeDate(this.get('start_date'));
  }.property('start_date'),

  formEndDate: function(k, v) {
    if (arguments.length > 1) {
      this.set('end_date', this.deserializeDate(v));
    }
    return this.serializeDate(this.get('end_date'));
  }.property('end_date'),

  serializeDate(date) {
    return DateTransform.create().serialize(date);
  },

  deserializeDate(date) {
    return DateTransform.create().deserialize(date);
  }
});
