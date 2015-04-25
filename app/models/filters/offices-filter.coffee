`import FilterModel from "t2-people/models/filter-model";`
`import FilterOption from "t2-people/services/filter-option";`

OfficesFilter = FilterModel.extend

  offices: null

  options: (->
    result = []
    result.pushObject FilterOption.create
      displayName: 'Team Human'
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

`export default OfficesFilter;`
