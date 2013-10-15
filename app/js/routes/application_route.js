define(['application'], function (App) {
  App.ApplicationRoute = Ember.Route.extend({

    init: function () {
      $(document).ajaxError(function (event, xhr) {
        if (xhr.status === 401) {
          var return_url = encodeURIComponent(document.location.href);
          document.location.href = 'http://t2api.herokuapp.com/sign_in?return_url=' + return_url;
        }
      });
    }

  });
})