App.FilterOption = Ember.Object.extend
  displayName: null
  slug: null

  selected: false
  visible: true
  isDefault: false

  # related data that corresponds to this option
  data: null

  sortOrder: (->
    [@get('displayName')]
  ).property('displayName')

  filterFunc: (record) -> true

  init: ->
    @_super()
    @selected = @isDefault
