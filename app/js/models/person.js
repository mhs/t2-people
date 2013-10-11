define(['application'], function (App) {
  App.Person = Ember.Model.extend({
    id: Ember.attr(),
    name: Ember.attr(),
    email: Ember.attr()
  });

  App.Person.adapter = Ember.RESTAdapter.create();
  App.Person.url = App.API_URL + '/people';
})