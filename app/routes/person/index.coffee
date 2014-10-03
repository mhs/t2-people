`import Ember from "ember";`
PersonIndexRoute = Ember.Route.extend
  model: ->
    @modelFor('person')

`export default PersonIndexRoute;`
