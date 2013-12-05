App.PeopleRoute = Ember.Route.extend
  beforeModel: ->
    @store.find('project')

  model: ->
    @store.find('person')

App.PeopleNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'person', {}
