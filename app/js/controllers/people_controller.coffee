App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null

  offices: Ember.computed.alias('controllers.application.offices')

  selectedOffice: Ember.Object.create({ name: 'Overview', value: App.NO_OFFICE_ID })

  office: ( ->
    @get('offices').findProperty('id', @get('selectedOffice.value'))
  ).property('offices', 'selectedOffice')

  officeOptions: (->
    @get('offices').map (office) ->
      Ember.Object.create({ name: office.get('name'), value: office.get('id') })
  ).property('offices')

  filteredPeople: (->
    office_id = @get('office.id') || App.NO_OFFICE_ID
    if office_id == App.NO_OFFICE_ID
      @get('model')
    else
      @get('model').filterBy('office.id', @get('office.id'))
  ).property('office', 'model')

  officeChanged: (->
    office = @get('controllers.application.selectedOffice')
    object = Ember.Object.create({ name: office.get('name'), value: office.get('id') })
    @set('selectedOffice', object)
  ).observes('controllers.application.selectedOffice')

  ourOfficeChanged: (->
    office =  @get('offices').findBy('id', @get('selectedOffice.value'))
    @set('controllers.application.selectedOffice', office)
  ).observes('selectedOffice')
