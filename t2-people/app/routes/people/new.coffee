`import Ember from "ember";`
PeopleNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord 'person', {}

`export default PeopleNewRoute;`
