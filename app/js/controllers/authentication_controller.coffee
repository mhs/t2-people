_redirectTo = (url)->
  uri = url
  uri += "?return_url=" + escape(location.href)
  location.href = uri

App.AuthenticationController = Ember.ObjectController.extend
  init: -> @set('accessToken', localStorage.accessToken)

  accessToken: null
  isAuthenticated: Ember.computed.notEmpty('accessToken')

  _redirectToSignIn: ->
    _redirectTo(window.ENV.apiHost + '/sign_in')

  _redirectToSignOut: ->
    _redirectTo(window.ENV.apiHost + '/sign_out')

  extractAccessToken: ->
    match = location.href.match(/authentication_token=([a-zA-Z0-9]+)/)
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
      url: "#{window.ENV.apiHost}/profile.json",
      dataType: 'json',
      data: {},
      success: (data) ->
        person = data.person
      }
    )
    person
  ).property('accessToken')
