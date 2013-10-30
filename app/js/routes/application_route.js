define(
  [
    'application',
    'views/search_people'
  ],
  function (App) {
    App.ApplicationRoute = Ember.Route.extend({
      actions: {
        search: function (keyword) {
          this.transitionTo('search', keyword);
        }
      },

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
            document.location.href = App.SIGN_IN_URL;
          }
        });
      }

    });
  }
)
