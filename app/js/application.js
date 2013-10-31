define(function () {
  var App = Ember.Application.create()
    , isDev = /localhost/.test(document.location.href)
    , tokenRegexp = /authentication_token=([a-zA-Z0-9]+)/;

  /* Resolve authentication. Removes
     authentication token from URL to put
     it in a cookie. */
  if (tokenRegexp.test(document.location.href)) {
    var token = document.location.href.match(tokenRegexp)
      , cookie;

    cookie  = 'authentication_token=' + token[1];
    cookie += '; expires=' + new Date(2100, 0).toUTCString();
    document.cookie = cookie;
    document.location.href = document.location.href.replace(tokenRegexp, '');
    return;
  }
  else if(tokenRegexp.test(document.cookie)) {
    App.AUTH_TOKEN = document.cookie.match(tokenRegexp)[1];
  }

  /* Calculate host based on current URL. If
     the URL includes a `localhost` substring,
     then we're in a development environment. */
  if (isDev) {
    App.API_HOST = 'http://localhost:5000';
  }
  else {
    App.API_HOST = 'http://t2api.herokuapp.com';
  }

  App.API_BASE_URL = App.API_HOST + '/api/v1';
  App.SIGN_IN_URL  = App.API_HOST + '/sign_in?return_url=' + escape(location.href);
  App.NAVBAR_URL   = App.API_HOST + '/navbar';

  window.App = App;

  return App;
});
