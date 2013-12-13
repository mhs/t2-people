App.Router.map ->
  @resource('people', queryParams: ['offices', 'projects'])

  @route('people.new', path: '/people/new')

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )
