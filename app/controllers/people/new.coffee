PeopleNewController = Ember.ObjectController.extend
  needs: ['application']

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != window.ENV.noOfficeId

  actions:
    save: (->
      model = @get('model')
      if model.get('errors')
        model.send('becameValid')
      model.save().then (=> @transitionToRoute 'people'), ((error) -> true)
    )

`export default PeopleNewController`
