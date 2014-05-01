PeopleRoute = Ember.Route.extend
  model: ->
    @store.all('person')

  setupController: (controller, model) ->
    controller.set('model', model)

`export default PeopleRoute`
