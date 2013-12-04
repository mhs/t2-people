App.PersonEditController = Ember.ObjectController.extend
  needs: ['application']

  actions:
    save: (->
      model = @get('model')
      id = model.get('id')
      formData = model.formData()
      Ember.$.ajax(
        url: window.ENV.apiHost + '/api/v1/people/' + id
        type: 'put'
        data: formData
        contentType: false
        processData: false
      ).done((data)=>
        @get('model').reload()
        @transitionToRoute('people')
      )
    )
