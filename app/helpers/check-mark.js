import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(val) {
  if (val) {
    return new Ember.Handlebars.SafeString('&#10003;');
  }
});
