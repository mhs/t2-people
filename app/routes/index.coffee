IndexRoute = Ember.Route.extend
  model: ->
    @modelFor 'application'

  redirect: ->
    @transitionTo 'people'

`export default IndexRoute`
