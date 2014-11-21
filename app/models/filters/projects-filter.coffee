`import Ember from "ember";`
`import FilterModel from "t2-people/models/filter-model";`
`import FilterOption from "t2-people/components/filter-option";`

ProjectsFilter = FilterModel.extend

  projects: null

  officeFilterModel: null


  options: (->
    filters =
      currentEmployee: (record) ->
        date = record.get('end_date')
        !date || date >= new Date
      exEmployee: (record) ->
        date = record.get('end_date')
        !!date && date < new Date
      notAllocated: (record) -> # TODO: check this - what if somebody is allocated for less than their percentBillable?
        !record.get('unsellable') && !record.get('allocated')
      onOverhead: (record) ->
        record.get('percentBillable') < 100
      onPto: (record) ->
        record.get('currentAllocations').mapBy('project.vacation').any (val) -> val
      onBillable: (record) ->
        record.get('currentAllocations').mapBy('billable').any (val) -> val

    result = []
    result.pushObject FilterOption.create
      displayName: 'Anything'
      slug: 'all_projects'
      isDefault: true
      filterFunc: (record) ->
        filters.currentEmployee(record)

    result.pushObject FilterOption.create
      displayName: 'Overhead'
      slug: 'overhead'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.onOverhead(record)

    result.pushObject FilterOption.create
      displayName: 'Available'
      slug: 'on_bench'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.notAllocated(record)

    result.pushObject FilterOption.create
      displayName: 'PTO'
      slug: 'pto'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.onPto(record)

    result.pushObject FilterOption.create
      displayName: 'Billable Projects'
      slug: 'billable'
      isDefault: false
      filterFunc: (record) ->
        filters.currentEmployee(record) &&
          filters.onBillable(record)

    result.pushObject FilterOption.create
      displayName: 'Are No Longer With The Company'
      slug: 'gone'
      isDefault: false
      filterFunc: (record) ->
        filters.exEmployee(record)

    projects = @get('projects').filter((project) -> project.get('name')) || []

    sortByName =
      sortProperties: ['sortOrder', 'name']
      content: projects

    projects = Ember.ArrayProxy.createWithMixins(Ember.SortableMixin,sortByName)

    projects.forEach (project) ->
      result.pushObject FilterOption.create
        displayName: project.get('name')
        slug: project.get('id')
        data: project
        filterFunc: (record) ->
          ourProject = @get('data')
          # the content property here is a bit of a hack, but 'seems' to work.
          record.get('currentAllocations').mapBy('project.content').any (r_project) ->
            r_project == ourProject

    result
  ).property('projects.@each.name')

  officeSelectionDidChange: (->
    offices = @get('officeFilterModel.selectedOptions').mapBy('data')
    if offices.contains(null)
      # default is selected
      @get('options').setEach('visible', true)
    else
      @get('options').forEach (option) ->
        visible = !option.data || offices.any (item) ->
          option.data.get('offices').contains(item)
        option.set('visible', visible)
  ).observes('officeFilterModel.options.@each.selected').on('init')

`export default ProjectsFilter;`
