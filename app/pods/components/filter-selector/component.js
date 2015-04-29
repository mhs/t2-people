import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['filter-selector'],
  classNameBindings: ['typeCSSClass'],

  isOpen: false,
  type: null,

  typeDisplay: function() {
    return this.get('type').capitalize();
  }.property('type'),

  typeCSSClass: function() {
    return 'filter-selector--' + this.get('type');
  }.property('type'),

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

  isOpenDidChange: function() {
    $('html,body')[this.get('isOpen') ? 'addClass' : 'removeClass']('noscroll');
  }.observes('isOpen'),

  selectedList: function() {
    return this.get('model.selectedOptions').mapBy('displayName').join(', ');
  }.property('model.selectedOptions'),

  actions: {
    reset() {
      this.get('model').reset();
    },

    toggleSelect(option) {
      this.get('model').toggleSelect(option);
    },

    toggleOpen() {
      this.toggleProperty('isOpen');
    }
  }
});
