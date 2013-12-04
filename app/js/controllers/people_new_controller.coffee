App.PeopleNewController = Ember.ObjectController.extend
  needs: ['application']

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != App.NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      formData = model.formData()
      Ember.$.ajax(
        url: window.ENV.apiHost + '/api/v1/people'
        type: 'post'
        data: formData
        contentType: false
        processData: false
      ).done((data)=>
        @get('model').deleteRecord()
        @transitionToRoute('people')
      ).error((resp) =>
        errors = Ember.$.parseJSON(resp.responseText)["errors"]
        @set('formErrors', errors)
      )
    )
