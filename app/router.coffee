App.Router.map ->
  @route('sign_out')

  @resource('people', queryParams: ['offices', 'projects', 'roles'])
  @route('people.new', path: '/people/new')

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )
