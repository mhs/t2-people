`import Ember from "ember";`
PersonEditRoute = Ember.Route.extend
  model: ->
    @modelFor('person')

`export default PersonEditRoute;`
