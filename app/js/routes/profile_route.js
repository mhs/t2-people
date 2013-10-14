define(['application', 'models/person'], function (App) {
  App.ProfileRoute = Ember.Route.extend({
    model: function () {
      var store = this.get('store');
      return store.find('person', 1);
    }
  });
})