App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    auth.extractAccessToken()
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.login()
  model: ->
    @store.push 'office',
      id: 1000
      name: 'Overview'
    @store.find('office')

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'people'
