App.NO_OFFICE_ID = '1000'
App.NO_PROJECT_ID = '1000'

App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    auth.extractAccessToken()
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.login()

  actions:
    newPerson: ->
      @transitionTo 'people.new'

  model: ->
    @store.find('office')

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'people'
