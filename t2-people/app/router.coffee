`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route('sign_out')

  @resource('people', queryParams: ['offices', 'projects', 'roles'])
  @route('people.new', path: '/people/new')

  @resource('person', path: '/people/:person_id', ->
    @route('edit')
  )

`export default Router;`
