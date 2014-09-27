`import { NO_PROJECT_ID, NO_OFFICE_ID } from "t2-people/utils/constants";`
`import Ember from "ember";`
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
        view.set('controller', @controllerFor('loading'))
        @set('loadingView', view)

      @router.one('didTransition', =>
        @get('loadingView').destroy()
      )

  model: ->
    @store.all('office')

`export default ApplicationRoute;`
