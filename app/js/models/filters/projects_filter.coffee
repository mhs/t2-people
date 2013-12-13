App.ProjectsFilter = App.FilterModel.extend

  projects: null

  officeFilterModel: null


  options: (->
    filters =
      currentEmployee: (record) ->
        date = record.get('endDate')
        !date || date > new Date
      notAllocated: (record) ->
        !record.get('currentAllocation')
      onPto: (record) ->
        record.get('currentAllocation.project.vacation')

    result = []
    result.pushObject App.FilterOption.create
      displayName: 'Anything'
      slug: 'all_projects'
      isDefault: true
      filterFunc: (record) ->
        filters.currentEmployee(record)

    result.pushObject App.FilterOption.create
      displayName: 'Available'
      slug: 'on_bench'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.notAllocated(record)

    result.pushObject App.FilterOption.create
      displayName: 'PTO'
      slug: 'pto'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.onPto(record)

    result.pushObject App.FilterOption.create
      displayName: 'Billable Projects'
      slug: 'billable'
      isDefault: false
      filterFunc: (record) -> true
    result.pushObject App.FilterOption.create
      displayName: 'Are No Longer With The Company'
      slug: 'gone'
      isDefault: false
      filterFunc: (record) -> true

    projects = @get('projects') || []

    projects.forEach (project) ->
      result.pushObject App.FilterOption.create
        displayName: project.get('name')
        slug: project.get('id')
        data: project
        filterFunc: (record) ->
          record.get('currentAllocation.project') == @get('data')
    result
  ).property('projects')

  # TODO: observe officeFilterModel.selectedOptions and control visibility

  fixSelection: ->
    selected = @get('selectedOptions')
    if selected.get('length') == 0
      @reset()
    else if selected.get('length') > 1
      @get('defaultOption').set('selected', false)

  selectedOptionsDidChange: (->
    # if anything other than the default is selected,
    #   deselect the default
    Ember.run.once(this, 'fixSelection')
  ).observes('options.@each.selected')
