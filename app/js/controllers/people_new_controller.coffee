App.PeopleNewController = Ember.ObjectController.extend
  needs: ['application']

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != App.NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      model.save().then =>
        @transitionToRoute 'people'
    )
