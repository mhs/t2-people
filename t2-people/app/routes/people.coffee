`import Ember from "ember";`
PeopleRoute = Ember.Route.extend
  model: ->
    @store.all('person')

  setupController: (controller, model, queryParams) ->
    controller.set('model', model)
    controller.set('queryParams', queryParams)

`export default PeopleRoute;`
