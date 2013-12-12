App.FilterModel = Ember.Object.extend
  options: null

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
    if typeof slugs == 'string'
      slugs = [slugs]
    @get('options').forEach (option) ->
      option.set('selected', slugs.contains(option.get('slug')))




