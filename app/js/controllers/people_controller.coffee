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

  roleFilterModel: (->
    App.RolesFilter.create()
  ).property()

  queryParamsDidChange: (->
    params = @get('queryParams')
    offices = params.offices || ''
    projects = params.projects || ''
    roles = params.roles || ''
    @get('officeFilterModel').select(offices.split(','))
    @get('projectFilterModel').select(projects.split(','))
    @get('roleFilterModel').select(roles.split(','))
  ).observes('queryParams')

  filteredPeople: (->
    officeFilter = @get('officeFilterModel')
    projectFilter = @get('projectFilterModel')
    roleFilter = @get('roleFilterModel')
    officeFunc = officeFilter.get('filterFunc')
    projectFunc = projectFilter.get('filterFunc')
    roleFunc = roleFilter.get('filterFunc')

    filterFunc = (record) ->
      officeFunc.call(officeFilter, record) &&
        projectFunc.call(projectFilter, record) &&
        roleFunc.call(roleFilter, record)

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

  selectedRoleSlugs: Ember.computed.alias 'roleFilterModel.selectedSlugs'

  setQueryParams: (->
    return unless @get('controllers.application.currentRouteName')
    Ember.run.once this, =>
      @transitionToRoute queryParams:
        offices: @get('selectedOfficeSlugs').join(','),
        projects: @get('selectedProjectSlugs').join(','),
        roles: @get('selectedRoleSlugs').join(',')
  ).observes(
    'officeFilterModel.options.@each.selected',
    'projectFilterModel.options.@each.selected',
    'roleFilterModel.options.@each.selected'
  )





