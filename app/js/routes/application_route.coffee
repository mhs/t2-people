App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.redirectToSignIn()

