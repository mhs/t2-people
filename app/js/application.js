define(function () {
  var App = Ember.Application.create()
    , isDev = /localhost/.test(document.location.href);

  App.AUTH_TOKEN = document.location.href.match(/authentication_token=([a-zA-Z0-9]+)/)
  App.AUTH_TOKEN = App.AUTH_TOKEN ? App.AUTH_TOKEN[1] : null;

  if (isDev)
    App.API_HOST = 'http://localhost:5000';
  else
    App.API_HOST = 'http://t2api.herokuapp.com';

  App.API_BASE_URL = App.API_HOST + '/api/v1';
  App.SIGN_IN_URL  = App.API_HOST + '/sign_in';
  App.NAVBAR_URL   = App.API_HOST + '/navbar';

  window.App = App;
  return App;
});
