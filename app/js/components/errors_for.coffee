App.ErrorsForComponent = Ember.Component.extend

  model: null

  errors: Ember.computed.alias('model.errors')

  hasErrors: Ember.computed.empty('errors.[]')
