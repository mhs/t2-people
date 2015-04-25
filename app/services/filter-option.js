import Ember from 'ember';

export default Ember.Object.extend({
  displayName: null,
  slug: null,

  selected: false,
  visible: true,
  isDefault: false,

  // related data that corresponds to this option
  data: null,

  sortOrder: function() {
    return [this.get('displayName')];
  }.property('displayName'),

  filterFunc() {
    return true;
  },

  setup: function() {
    this.selected = this.isDefault;
  }.on('init')
});
