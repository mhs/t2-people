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
    @store.push 'project',
      id: App.NO_PROJECT_ID
      name: 'Anything'
    @store.find('office')

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('selectedOffice', model.findBy('id', App.NO_OFFICE_ID))

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'people'
