import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
    page:      { refreshModel: true },
    office_id: { refreshModel: true },
    archived:  { refreshModel: true }
  },

  model: function(params) {
    let key, newParams, value;

    newParams = {};
    for (key in params) {
      value = params[key];
      if (value !== "null" && value !== "undefined") {
        newParams[key] = value;
      }
    }

    return this.store.find('projectListItem', newParams);
  }
});
