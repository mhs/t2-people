App.FilterSelectorComponent = Ember.Component.extend
  options: []

  filterFunc: (->
    filters = @get('selectedOptions').mapProperty('filterFunc')
    (record) ->
      filters.any (filter) ->
        filter.apply(null, record)
  ).property('selectedOptions')

  selectedOptions: (->
    @get('options').filter (item) ->
      item.get('selected') && item.get('visible')
  ).property('options', 'options.@each.selected', 'options.@each.visible')

  actions:
    reset: ->
      @get('options').forEach (item) ->
        item.set('selected', item.get('isDefault'))
