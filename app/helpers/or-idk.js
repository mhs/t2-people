import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(val) {
  if (val) {
    return val;
  } else {
    return new Ember.Handlebars.SafeString('???');
  }
});
