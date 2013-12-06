App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null

  offices: Ember.computed.alias('controllers.application.offices')
  anyProject: (->
    @store.all('project').findBy('id', App.NO_PROJECT_ID)
  ).property()

  selectedOffice: Ember.computed.alias('controllers.application.selectedOffice')

  office: ( ->
    @get('offices').findProperty('id', @get('selectedOffice.value'))
  ).property('offices', 'selectedOffice')

  selectedProject: ( ->
    @get('anyProject')
  ).property()

  projects: (->
    office = @get('selectedOffice')
    filteredProjects = if office.get('id') == App.NO_OFFICE_ID
                         @store.filter('project', (record) -> true)
                       else
                         op = office.get('projects')
                         op.pushObject(@get('anyProject'))
                         op
    filteredProjects.sortBy('name')
  ).property('selectedOffice')

  filteredPeople: (->
    office_id = @get('office.id') || App.NO_OFFICE_ID
    if office_id == App.NO_OFFICE_ID
      officePeople = @get('model')
    else
      officePeople = @get('model').filterBy('office.id', @get('office.id'))

    projectId = @get('selectedProject.id')
    if projectId == App.NO_PROJECT_ID || !projectId
      officePeople
    else
      officePeople.filterBy 'currentAllocation.project.id', projectId

  ).property('office', 'model', 'selectedProject')
