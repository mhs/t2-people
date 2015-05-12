import Ember from 'ember';

export default Ember.Component.extend({
  visible: false,
  classNames: ['progress-spinner'],
  classNameBindings: ['visible:progress-spinner--visible']
});
