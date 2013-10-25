define(
  [
    'application',
    'controllers/skills_controller',
    'views/skills'
  ],
  function (App) {
    App.SkillsRoute = Ember.Route.extend({

      model: function () {
        return $.get(App.API_BASE_URL + '/skills');
      },

      setupController: function (controller, model) {
        var skills = model.map(App.Raw2EmberObject);
        controller.set('skills', skills);
        controller.set('skillFilters', skills);
      }

    });
  }
);
