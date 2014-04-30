App.PeopleNewController = Ember.ObjectController.extend
  needs: ['application']

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != App.NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      if model.get('errors')
        model.send('becameValid')
      model.save().then (=> @transitionToRoute 'people'), ((error) -> true)
    )
