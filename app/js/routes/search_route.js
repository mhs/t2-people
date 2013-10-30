define(
  [
    'application',
    'controllers/search_controller',
    'views/search_people_item'
  ],
  function (App) {
    App.SearchRoute = Ember.Route.extend({
      model: function (params) {
        return Ember.RSVP.hash({
          keyword: decodeURIComponent(params.keyword),
          people: $.get(App.API_BASE_URL + '/people')
        });
      },

      setupController: function (controller, model) {
        controller.setProperties({
          keyword: model.keyword,
          people: model.people.people.map(App.Raw2EmberObject)
        });
      }
    });
  }
);
