`import Ember from "ember";`
FilterModel = Ember.Object.extend
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

  toggleSelect: (option) ->
    if @get('selectedOptions').contains(option)
      @removeSelect(option)
    else
      @addSelect(option)

  addSelect: (option) ->
    if option == @get('defaultOption')
      @reset()
    else
      option.set('selected', true)

  removeSelect: (option) ->
    return if option == @get('defaultOption')
    option.set('selected', false)

  reset: ->
    @get('options').setEach 'selected', false
    @get('defaultOption').set 'selected', true

  # selectedSlugs: Ember.computed.mapBy 'selectedOptions', 'slug'
  selectedSlugs: (->
    @get('selectedOptions').mapProperty('slug')
  ).property('selectedOptions')

  selectOptions: (func) ->
    @get('options').forEach (option) ->
      option.set('selected', func.call(this, option))

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

`export default FilterModel;`
