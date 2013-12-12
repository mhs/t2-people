App.FilterSelectorComponent = Ember.Component.extend

  options: Ember.computed.alias('model.options')
  selectedOptions: Ember.computed.alias('model.selectedOptions')
  validOptions: Ember.computed.alias('model.validOptions')

  isOpen: false

  actions:
    reset: ->
      @get('options').forEach (item) ->
        item.set('selected', item.get('isDefault'))
    select: (slug) ->
      @get('model').select(slug)
