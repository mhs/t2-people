import Ember from 'ember';

export default Ember.Select.extend({
  optionLabelPath: 'content.name',
  optionValuePath: 'content.id',

  // TODO: no
  content: function() {
    return this.get('parentView.controller.store').all('office').filter(function(office) {
      return !office.get('deleted');
    });
  }.property()
});
