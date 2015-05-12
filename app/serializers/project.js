import Ember from 'ember';
import ApplicationSerializer from 't2-people/serializers/application';

export default ApplicationSerializer.extend({
  serializeHasMany: function(record, json, relationship) {
    let key = relationship.key;
    if (key === "offices") {
      return json[this.keyForRelationship(key, relationship.kind)] = Ember.get(record, key).mapBy('id');
    } else {
      return this._super();
    }
  }
});
