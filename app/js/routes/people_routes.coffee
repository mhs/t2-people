App.PeopleRoute = Ember.Route.extend
  beforeModel: ->
    @store.find('project')

  model: ->
    @store.find('person')

  setupController: (controller, model, queryParams) ->
    controller.set('model', model)
    controller.set('queryParams', queryParams)


App.PeopleNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'person', {}
