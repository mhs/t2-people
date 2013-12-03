App.PersonEditController = Ember.ObjectController.extend
  actions:
    save: (->
      @get('model').save().then(=>
        @transitionToRoute('people')
      )
    )
