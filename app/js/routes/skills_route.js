define(
  [
    'application'
  ],
  function (App) {
    App.SkillsRoute = Ember.Route.extend({

      model: function () {
        return Ember.RSVP.hash({
          people: $.get(App.API_BASE_URL + '/people')
        });
      },

      setupController: function (controller, model) {
        controller.set('people', Ember.Object.create(model.people));
      }

    });
  }
);
