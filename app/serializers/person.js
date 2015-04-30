/*jshint unused:false */

import ApplicationSerializer from 't2-people/serializers/application';

export default ApplicationSerializer.extend({
  serializeIntoHash: function(data, type, snapshot, options) {
    return data['formData'] = this.generateFormDataFromSnapshop(snapshot);
  },

  generateFormDataFromSnapshop: function(snapshot) {
    let prop, value;
    let serializedHash = this.serialize(snapshot);
    let data = new FormData();
    let skipProperties = 'avatar office_slug current_allocation_id'.w();

    for (prop in serializedHash) {
      value = serializedHash[prop];
      if (!skipProperties.contains(prop)) {
        if (value === null) { value = ''; }
        data.append('person[' + prop + ']', value);
      }
    }

    let file = snapshot.record.get('avatarFile');
    if (file) {
      data.append('person[avatar]', file);
    }
    return data;
  }
});
