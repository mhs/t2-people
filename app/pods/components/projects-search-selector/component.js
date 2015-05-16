import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['filter-selector'],

  isOpen: false,
  projects: [],

  setupDocumentClick: function() {
    Ember.$(document).on('click.filter', (evt) => {
      if(this.get('isOpen') && !(Ember.$.contains(this.get('element'), evt.target))) {
        this.sendAction('done');
      }
    });
  }.on('didInsertElement'),

  teardownDocumentClick: function() {
    Ember.$(document).off('click.filter');
  }.on('willDestroyElement'),

  isOpenDidChange: function() {
    $('html,body')[this.get('isOpen') ? 'addClass' : 'removeClass']('noscroll');
  }.observes('isOpen'),

  actions: {
    done() {
      this.sendAction('done');
    }
  }
});

