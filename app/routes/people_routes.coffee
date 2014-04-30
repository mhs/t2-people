App.PeopleRoute = Ember.Route.extend
  model: ->
    @store.all('person')

  setupController: (controller, model, queryParams) ->
    controller.set('model', model)
    controller.set('queryParams', queryParams)


App.PeopleNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'person', {}
