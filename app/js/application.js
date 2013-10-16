define(function () {
  var App = Ember.Application.create()
    , isDev = /localhost/.test(document.location.href);

  App.AUTH_TOKEN = document.location.href.match(/authentication_token=([a-zA-Z0-9]+)/)
  App.AUTH_TOKEN = App.AUTH_TOKEN ? App.AUTH_TOKEN[1] : null;

  if (isDev) {
    App.API_BASE_URL = 'http://localhost:5000/api/v1';
    App.SIGN_IN_URL  = 'http://localhost:5000/sign_in?redirect_url=' + encodeURIComponent(document.location.href);
  }
  else {
    App.API_BASE_URL = 'http://t2api.herokuapp.com/api/v1';
    App.SIGN_IN_URL  = 'http://t2api.herokuapp.com/sign_in?redirect_url=' + encodeURIComponent(document.location.href);
  }

  window.App = App;
  return App;
});
