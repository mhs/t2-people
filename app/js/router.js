define(
  [
    'application',
    'helpers',
    'routes/application_route',
    'routes/profile_route'
  ],
  function (App) {
    App.Router.map(function () {
      this.resource('profile', { path: '/' });
    })
  }
);
