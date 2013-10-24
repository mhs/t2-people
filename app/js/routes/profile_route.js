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
        return Ember.RVSP.hash({
          person: $.get(App.API_BASE_URL + '/people/' + App.AUTH_TOKEN + '/profile'),
          skills: $.get(App.API_BASE_URL + '/skills')
        });
      },

      setupController: function (controller, model) {
        controller.set('person', Ember.Object.create(model.person.person));
        controller.set('skills', model.skills.map(App.Raw2EmberObject));
      }

    });
  }
);
