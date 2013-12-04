App.PersonEditController = Ember.ObjectController.extend
  needs: ['application']

  actions:
    save: (->
      model = @get('model')
      if model.get('errors')
        model.send('becameValid')
      model.save().then =>
        @transitionToRoute 'people'
    )
