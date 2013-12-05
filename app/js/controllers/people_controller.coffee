App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null

  offices: Ember.computed.alias('controllers.application.offices')

  selectedOffice: Ember.computed.alias('controllers.application.selectedOffice')

  office: ( ->
    @get('offices').findProperty('id', @get('selectedOffice.value'))
  ).property('offices', 'selectedOffice')

  selectedProject: null
  projects: (->
    office = @get('selectedOffice')
    if office.get('id') == App.NO_OFFICE_ID
      @store.filter('project', (record) -> true)
    else
      office.get('projects')
  ).property('selectedOffice')

  filteredPeople: (->
    office_id = @get('office.id') || App.NO_OFFICE_ID
    if office_id == App.NO_OFFICE_ID
      @get('model')
    else
      @get('model').filterBy('office.id', @get('office.id'))
  ).property('office', 'model')

  # projects: (->
  #   projects = @get('currentOffice.projects')
  #   sortByName =
  #     sortProperties: ['sortOrder', 'name']
  #     content: projects
  #   Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, sortByName)
  # ).property('currentOffice')
