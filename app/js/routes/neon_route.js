define(
  [
    'application',
    'controllers/neon_controller'
  ],
  function (App) {
    App.NeonRoute = Ember.Route.extend({
      
      model: function (params) {
        // TODO: Change this when the /people/:id
        // route is ready on T2API
        return Ember.RSVP.hash({
          skills: $.get(App.API_BASE_URL + '/skills'),
          person: $.get(App.API_BASE_URL + '/people/' + params.neon)
        });
      },

      setupController: function (controller, model) {
        controller.set('person', App.Raw2EmberObject(model.person.person));
        controller.set('skills', model.skills);
      }

    });
  }
);
