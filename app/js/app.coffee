Ember.FEATURES["query-params"] = true
window.App = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_TRANSITIONS_INTERNAL: true
  LOG_VIEW_LOOKUPS: true
App.Store = DS.Store.extend()


