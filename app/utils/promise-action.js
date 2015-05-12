import Ember from 'ember';

export default function(fn) {
  return Ember.computed(function() {
    let self = this;
    return function() {
      let args = arguments;
      return new Ember.RSVP.Promise(function(resolve) {
        resolve(fn.apply(self, args));
      });
    };
  });
}
