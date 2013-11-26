App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    auth.extractAccessToken()
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.login()
App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'people'
