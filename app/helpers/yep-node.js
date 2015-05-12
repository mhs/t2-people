import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(val) {
  if (val) {
    return new Ember.Handlebars.SafeString('Yes');
  } else {
    return new Ember.Handlebars.SafeString('No');
  }
});
