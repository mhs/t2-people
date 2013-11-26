App.Router.map ->
  @resource('people', ->
    @route 'new'
  )

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )
