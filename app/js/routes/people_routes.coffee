App.PeopleRoute = Ember.Route.extend
  model: ->
    @store.find('person')

App.PeopleNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'person', {}
