App.NO_OFFICE_ID = '1000'
App.NO_PROJECT_ID = '1000'

ApplicationRoute = Ember.Route.extend
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
      unless @get('loadingView')
        view = @container.lookup('view:loading').append()
        @set('loadingView', view)

      @router.one('didTransition', =>
        @get('loadingView').destroy()
      )

  model: ->
    @store.all('office')

`export default ApplicationRoute`
