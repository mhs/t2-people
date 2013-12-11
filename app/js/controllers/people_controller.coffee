App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null
  queryParams: null

  offices: Ember.computed.alias('controllers.application.offices')
  anyProject: (->
    @store.all('project').findBy('id', App.NO_PROJECT_ID)
  ).property()

  selectedOffice: (->
    queryId = @get('queryParams').office_id || App.NO_OFFICE_ID
    @get('offices').findProperty('id', queryId)
  ).property()

  office: ( ->
    @get('offices').findProperty('id', @get('selectedOffice.value'))
  ).property('offices', 'selectedOffice')

  selectedProject: (->
    queryId = @get('queryParams').project_id || App.NO_PROJECT_ID
    @get('projects').findProperty('id', queryId)
  ).property()

  projects: (->
    office = @get('selectedOffice')
    filteredProjects = if office.get('id') == App.NO_OFFICE_ID
                         @store.filter('project', (record) -> true)
                       else
                         projects = Ember.ArrayProxy.create(content: [@get('anyProject')])
                         office.get('projects').forEach (proj)-> projects.pushObject(proj)
                         projects
    filteredProjects.sortBy('name')
  ).property('selectedOffice')

  filteredPeople: (->
    officeId = @get('queryParams').office_id || App.NO_OFFICE_ID
    if officeId == App.NO_OFFICE_ID
      officePeople = @get('model')
    else
      officePeople = @get('model').filterBy('office.id', @get('office.id'))

    projectId = @get('queryParams').project_id || App.NO_PROJECT_ID
    if projectId == App.NO_PROJECT_ID || !projectId
      result = officePeople
    else
      result = officePeople.filterBy 'currentAllocation.project.id', projectId

    searchRegex = new RegExp(@get('searchTerm') || '', 'i')
    result.filter (item) =>
      item.matches(searchRegex)
  ).property('queryParams', 'searchTerm')

  updateSearch: (->
    Ember.run.debounce({name: 'searchDebounce'}, =>
      @set('searchTerm', @get('search'))
    , 150)
  ).observes('search')

  updateRoute: ->
    @transitionToRoute queryParams:
      project_id: @get('selectedProject.id')
      office_id: @get('selectedOffice.id')

  selectedOfficeUpdated: (->
    if @get("selectedOffice.id") != App.NO_OFFICE_ID
      @set("selectedProject", @get('anyProject'))
    @updateRoute()
  ).observes('selectedOffice')

  selectedProjectUpdated: (->
    @updateRoute()
  ).observes('selectedProject')





