import ApplicationSerializer from 't2-people/serializers/application';

export default ApplicationSerializer.extend({
  extractArray: function(store, primaryType, payload, id, requestType) {
    payload.projectListItems = payload.projects;
    delete payload.projects;
    return this._super(store, primaryType, payload, id, requestType);
  }
});
