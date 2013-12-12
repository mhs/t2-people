App.FilterSelectorComponent = Ember.Component.extend

  options: Ember.computed.alias('model.options')
  selectedOptions: Ember.computed.alias('model.selectedOptions')
  validOptions: Ember.computed.alias('model.validOptions')

  isOpen: false

  actions:
    reset: ->
      @get('model').reset()
    select: (option) ->
      @get('model').addSelect(option)
    unselect: (option) ->
      @get('model').removeSelect(option)
