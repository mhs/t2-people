Router = Ember.Router.extend()

Router.map ->
  @route('sign_out')

  @resource('people')
  @route('people.new', path: '/people/new')

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )

`export default Router`
