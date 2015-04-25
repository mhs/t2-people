_redirectTo = (url)->
  uri = url
  uri += "?return_url=" + escape(location.href)
  location.href = uri

`import Ember from "ember";`
`import ENV from "t2-people/config/environment";`
AuthenticationController = Ember.Controller.extend
  init: -> @set('accessToken', localStorage.accessToken)

  accessToken: null
  isAuthenticated: Ember.computed.notEmpty('accessToken')

  _redirectToSignIn: ->
    _redirectTo(ENV.apiHost + '/sign_in')

  _redirectToSignOut: ->
    _redirectTo(ENV.apiHost + '/sign_out')

  extractAccessToken: ->
    match = location.href.match(/authentication_token=([a-zA-Z0-9_-]+)/)
    if (match)
      @set('accessToken', match[1])
      location.href = location.origin

  login: ->
    @_redirectToSignIn()

  logout: ->
    @set('accessToken', null)
    @_redirectToSignOut()

  accessTokenChanged: (->
    token = @get('accessToken')

    if (token)
      localStorage.accessToken = token
    else
      delete localStorage.accessToken
  ).observes("accessToken")

  currentUser: (->
    person = {}
    Ember.$.ajax({
      # ASYNC MY BALLS
      async: false,
      url: "#{ENV.apiHost}/profile.json",
      dataType: 'json',
      data: {},
      success: (data) ->
        person = data.person
      }
    )
    person
  ).property('accessToken')

`export default AuthenticationController;`
