`import Ember from "ember";`
`import OfficesFilter from "t2-people/models/filters/offices-filter";`
`import ProjectsFilter from "t2-people/models/filters/projects-filter";`
`import RolesFilter from "t2-people/models/filters/roles-filter";`

PeopleController = Ember.ArrayController.extend
  needs: ['application']
  queryParams: ["projects", "offices", "roles", "search"]

  projects: ""
  offices: ""
  roles: ""
  search: ""
  searchTerm: null

  officeFilterModel: (->
    OfficesFilter.create(offices: @get('controllers.application.offices'))
  ).property('controllers.application.offices')

  projectFilterModel: (->
    ProjectsFilter.create
      projects: @store.all('project')
      officeFilterModel: @get('officeFilterModel')
  ).property()

  roleFilterModel: (->
    RolesFilter.create()
  ).property()

  queryParamsDidChange: (->
    @get('officeFilterModel').select(@get('offices').split(','))
    @get('projectFilterModel').select(@get('projects').split(','))
    @get('roleFilterModel').select(@get('roles').split(','))
  ).observes('offices', 'projects', 'roles')

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
    officePeople = officePeople.filter (item) =>
      item.matches(searchRegex)

    sortByName =
      sortProperties: ['name']
      content: officePeople

    Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, sortByName)
  ).property(
    'officeFilterModel.selectedOptions',
    'projectFilterModel.selectedOptions',
    'roleFilterModel.selectedOptions',
    'searchTerm')

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

`export default PeopleController;`
