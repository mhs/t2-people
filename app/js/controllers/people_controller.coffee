App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  roleFilter: null
  queryParams: null

  officeFilterModel: (->
    App.OfficesFilter.create(offices: @get('controllers.application.offices'))
  ).property('controllers.application.offices')

  projectFilterModel: (->
    App.ProjectsFilter.create(projects: @store.all('project'),
                              officeFilterModel: @get('officeFilterModel')
    )
  ).property()

  queryParamsDidChange: (->
    params = @get('queryParams')
    offices = params.offices || ''
    projects = params.projects || ''
    @get('officeFilterModel').select(offices.split(','))
    @get('projectFilterModel').select(projects.split(','))
  ).observes('queryParams')

  offices: Ember.computed.alias('controllers.application.offices')

  anyProject: (->
    @store.all('project').findBy('id', App.NO_PROJECT_ID)
  ).property()

  selectedProject: (->
    queryId = @get('queryParams').project_id || App.NO_PROJECT_ID
    @get('projects').findProperty('id', queryId)
  ).property()

  projects: (->
    return []
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
    officeFilter = @get('officeFilterModel')
    projectFilter = @get('projectFilterModel')
    officeFunc = officeFilter.get('filterFunc')
    projectFunc = projectFilter.get('filterFunc')

    filterFunc = (record) ->
      officeFunc.call(officeFilter, record) && projectFunc.call(projectFilter, record)

    officePeople = @get('model').filter(filterFunc)

    searchRegex = new RegExp(@get('searchTerm') || '', 'i')
    officePeople.filter (item) =>
      item.matches(searchRegex)
  ).property('officeFilterModel.selectedOptions', 'projectFilterModel.selectedOptions', 'queryParams', 'searchTerm')

  updateSearch: (->
    Ember.run.debounce({name: 'searchDebounce'}, =>
      @set('searchTerm', @get('search'))
    , 150)
  ).observes('search')

  selectedOfficeSlugs: Ember.computed.alias 'officeFilterModel.selectedSlugs'

  selectedProjectSlugs: Ember.computed.alias 'projectFilterModel.selectedSlugs'

  setQueryParams: (->
    return unless @get('controllers.application.currentRouteName')
    Ember.run.once this, =>
      @transitionToRoute queryParams:
        offices: @get('selectedOfficeSlugs').join(','),
        projects: @get('selectedProjectSlugs').join(',')
  ).observes('officeFilterModel.options.@each.selected', 'projectFilterModel.options.@each.selected')





