App.FilterModel = Ember.Object.extend
  options: null

  defaultOption: (->
    @get('options').filterBy('isDefault', true).get('firstObject')
  ).property('options.@each.isDefault')

  selectedOptions: (->
    @get('options').filter (item) ->
      item.get('selected') && item.get('visible')
  ).property('options', 'options.@each.selected', 'options.@each.visible')

  filterFunc: (->
    options = @get('selectedOptions')
    (record) ->
      options.any (option) ->
        option.get('filterFunc').call(option, record)
  ).property('selectedOptions')

  select: (slugs) ->
    @selectOptions (option) ->
      slugs.contains(option.get('slug'))

  addSelect: (option) ->
    if option == @get('defaultOption')
      @reset()
    else
      option.set('selected', true)

  removeSelect: (option) ->
    return if option == @get('defaultOption')
    option.set('selected', false)

  reset: ->
    @selectOptions (item) -> false
    @get('defaultOption').set('selected', true)

  selectOptions: (func) ->
    @get('options').forEach (option) ->
      option.set('selected', func.call(this, option))
