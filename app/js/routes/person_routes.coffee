App.PersonRoute = Ember.Route.extend
  model: (params) ->
    @store.find('person', params.person_id)

App.PersonEditRoute = Ember.Route.extend
  model: ->
    @modelFor('person')

App.PersonIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('person')
