import Ember from 'ember';

export default Ember.ArrayController.extend({
  offices: Ember.computed.alias('content')
});
