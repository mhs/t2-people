define(
  [
    'application',
    'controllers/skills_controller',
    'views/skills'
  ],
  function (App) {
    App.SkillsRoute = Ember.Route.extend({

      model: function () {
        return Ember.RSVP.hash({
          people: $.get(App.API_BASE_URL + '/people')
        });
      },

      setupController: function (controller, model) {
        var skills = [
          Ember.Object.create({ id: 1, name: 'Ruby', people: [
            Ember.Object.create({ id: 1, name: 'Federico Bana' })
          ]}),
          Ember.Object.create({ id: 2, name: 'Javascript', people: [
            Ember.Object.create({ id: 2, name: 'Alvaro Gil' })
          ]})
        ];
        controller.set('skills', skills);
        controller.set('skillFilters', skills)
      }

    });
  }
);
