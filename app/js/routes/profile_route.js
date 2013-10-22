define(
  [
    'application',
    'controllers/profile_controller',
    'models/person',
    'views/edit_profile_modal',
    'views/editable_skill_list'
  ],
  function (App) {
    App.ProfileRoute = Ember.Route.extend({

      model: function () {
        return $.get(App.API_BASE_URL + '/people/' + App.AUTH_TOKEN + '/profile');
      },

      setupController: function (controller, model) {
        controller.set('person', Ember.Object.create(model.person));
      }

    });
  }
);
