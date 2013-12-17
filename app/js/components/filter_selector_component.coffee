App.FilterSelectorComponent = Ember.Component.extend

  options: Ember.computed.alias('model.options')
  selectedOptions: Ember.computed.alias('model.selectedOptions')
  validOptions: Ember.computed.alias('model.validOptions')

  didInsertElement: ->
    Ember.$('body').on 'click', (evt) =>
      if @get('isOpen') && !($.contains(@get('element'), evt.target))
          @set('isOpen', false)
  selectedList: (->
    @get('selectedOptions').mapBy('displayName').join(', ')
  ).property('selectedOptions')

  isOpen: false

  actions:
    reset: ->
      @get('model').reset()
    select: (option) ->
      @get('model').addSelect(option)
    unselect: (option) ->
      @get('model').removeSelect(option)
    toggleOpen: ->
      @toggleProperty('isOpen')
