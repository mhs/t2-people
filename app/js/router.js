define(
  [
    'application',
    'helpers',
    'routes/application_route',
    'routes/profile_route',
    'routes/skills_route',
    'routes/search_route',
    'routes/neon_route'
  ],
  function (App) {
    App.Router.map(function () {
      this.resource('profile', { path: '/' });
      this.resource('skills',  { path: '/skills' });
      this.resource('search',  { path: '/search/:keyword' });
      this.resource('neon',    { path: '/neon/:id' });
    })
  }
);
