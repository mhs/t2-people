App.OfficesFilter = App.FilterModel.extend

  offices: null

  options: (->
    result = []
    result.pushObject App.FilterOption.create
      displayName: 'Team Neo'
      slug: 'all_offices'
      isDefault: true
      filterFunc: (record) -> true
    offices = @get('offices') || []
    offices.forEach (office) ->
      result.pushObject App.FilterOption.create
        displayName: office.get('name')
        slug: office.get('slug')
        data: office
        filterFunc: (record) ->
          record.get('office') == @get('data')
    result
  ).property('offices')

  selectedOptionsDidChange: (->
    # if anything other than the default is selected,
    #   deselect the default
    selected = @get('selectedOptions')
    if selected.get('length') == 0
      @reset()
    else if selected.get('length') > 1
      @get('defaultOption').set('selected', false)
  ).observes('options.@each.selected')
