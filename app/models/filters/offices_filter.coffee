OfficesFilter = App.FilterModel.extend

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

`export default OfficesFilter`
