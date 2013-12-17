App.NO_OFFICE_ID = '1000'
App.NO_PROJECT_ID = '1000'

App.ApplicationRoute = Ember.Route.extend
  beforeModel: (transition) ->
    auth = @controllerFor('authentication')
    auth.extractAccessToken()
    if !auth.get('isAuthenticated')
      transition.abort()
      auth.login()
    Ember.RSVP.all [@store.find('office'), @store.find('person'), @store.find('project')]


  actions:
    newPerson: ->
      @transitionTo 'people.new'
    loading: ->
      view = Ember.View.create(
        templateName: 'loading'
        elementId: 'loading'
        controller: @controllerFor('loading')
      ).append()

      @router.one('didTransition', ->
        view.destroy()
      )

  model: ->
    @store.all('office')

App.IndexRoute = Ember.Route.extend
  model: ->
    @modelFor 'application'
  redirect: ->
    @transitionTo 'people'
