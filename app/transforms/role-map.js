import DS from 'ember-data';
import RoleMap from 't2-people/utils/role-map';

export default DS.Transform.extend({
  serialize: function(object) {
    return object.get('content');
  },
  deserialize: function(json) {
    return RoleMap.create({
      content: json
    });
  }
});
