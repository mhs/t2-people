define(
  [
    'application',
    'routes/profile_route'
  ],
  function (App) {
    App.Router.map(function () {
      this.resource('profile', { path: '/' });
    })
  }
);
