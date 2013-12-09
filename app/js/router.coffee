App.Router.map ->
  @resource('people', queryParams: ['office_id', 'project_id'])

  @route('people.new', path: '/people/new')

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )
