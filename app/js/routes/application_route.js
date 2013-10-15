define(['application'], function (App) {
  App.ApplicationRoute = Ember.Route.extend({

    init: function () {
      /* Redirect to login if the auth token is
         not in the URL. */
      if (!App.AUTH_TOKEN) {
        document.location.href = App.SIGN_IN_URL;
      }

      /* Send auth token in header for every
         ajax request from the app to the API. */
      $.ajaxPrefilter(function (options) {
        options.headers = options.headers || {};
        options.headers['Authorization'] = App.AUTH_TOKEN;
      })

      /* Capture all ajax errors and respond
         accordingly. */
      $(document).ajaxError(function (event, xhr) {
        if (xhr.status === 401) {
          var return_url = encodeURIComponent(document.location.href);
          document.location.href = 'http://t2api.herokuapp.com/sign_in?return_url=' + return_url;
        }
      });
    }

  });
})