App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null

  selectedOffice: Ember.Object.create({ name: 'Overview', value: App.NO_OFFICE_ID })

  office: ( ->
    @get('controllers.application.offices').findProperty('id', @get('selectedOffice.value'))
  ).property('controllers.application.offices', 'selectedOffice')

  officeOptions: (->
    @get('controllers.application.offices').map (office) ->
      Ember.Object.create({ name: office.get('name'), value: office.get('id') })
  ).property('controllers.application.offices')

  filteredPeople: (->
    office_id = @get('office.id') || App.NO_OFFICE_ID
    if office_id == App.NO_OFFICE_ID
      @get('model')
    else
      @get('model').filterBy('office.id', @get('office.id'))
  ).property('office', 'model')

  actions:
    profile: -> console.log "profile"
    edit: -> console.log "edit"
