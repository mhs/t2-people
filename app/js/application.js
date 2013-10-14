define(function () {
  var App = Ember.Application.create();

  App.API_URL = 'http://localhost:3000/api/v1';

  App.Store = DS.Store.extend();

  DS.RESTAdapter.reopen({
    url: 'http://localhost:3000',
    namespace: 'api/v1'
  });

  return App;
});