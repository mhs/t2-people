import Ember from 'ember';

export default Ember.Component.extend({
  hasErrors: Ember.computed.notEmpty('model.errors.[]')
});
