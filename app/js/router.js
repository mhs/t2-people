define(
  [
    'application',
    'helpers',
    'routes/application_route',
    'routes/profile_route',
    'routes/skills_route'
  ],
  function (App) {
    App.Router.map(function () {
      this.resource('profile', { path: '/' });
      this.resource('skills', { path: '/skills' });
    })
  }
);
