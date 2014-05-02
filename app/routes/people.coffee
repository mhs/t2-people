PeopleRoute = Ember.Route.extend
  model: ->
    @store.all('person')

`export default PeopleRoute`
