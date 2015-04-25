import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['filter-selector'],

  isOpen: false,

  setupDocumentClick: function() {
    Ember.$(document).on('click.filter', (evt) => {
      if(this.get('isOpen') && !(Ember.$.contains(this.get('element'), evt.target))) {
        this.set('isOpen', false);
      }
    });
  }.on('didInsertElement'),

  teardownDocumentClick: function() {
    Ember.$(document).off('click.filter');
  }.on('willDestroyElement'),

  selectedList: function() {
    return this.get('model.selectedOptions').mapBy('displayName').join(', ');
  }.property('model.selectedOptions'),

  actions: {
    reset() {
      this.get('model').reset();
    },

    select(option) {
      this.get('model').addSelect(option);
    },

    unselect(option) {
      this.get('model').removeSelect(option);
    },

    toggleOpen() {
      this.toggleProperty('isOpen');
    }
  }
});
