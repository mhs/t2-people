`import FilterModel from 'people/models/filter_model'`
`import FilterOption from 'people/components/filter_option'`

OfficesFilter = FilterModel.extend

  offices: null

  options: (->
    result = []
    result.pushObject FilterOption.create
      displayName: 'Team Neo'
      slug: 'all_offices'
      isDefault: true
      filterFunc: (record) -> true
    offices = @get('offices') || []
    offices.forEach (office) ->
      result.pushObject FilterOption.create
        displayName: office.get('name')
        slug: office.get('slug')
        data: office
        filterFunc: (record) ->
          record.get('office') == @get('data')
    result
  ).property('offices')

`export default OfficesFilter`
