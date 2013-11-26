App.Router.map ->
  @resource('people')
  @resource('person', path: 'people/:id')
