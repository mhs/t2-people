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
          people: $.get(App.API_BASE_URL + '/people'),
          person_id: params.neon
        });
      },

      setupController: function (controller, model) {
        var people = model.people.people.map(App.Raw2EmberObject)
          , person = people.filterBy('id', parseInt(model.person_id, 10)).get('firstObject');
        controller.set('person', person);
        controller.set('skills', model.skills);
      }

    });
  }
);
