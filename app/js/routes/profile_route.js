define(['application', 'models/person'], function (App) {
  App.ProfileRoute = Ember.Route.extend({

    model: function () {
      return $.get(App.API_URL + '/profile');
    }

  });
})