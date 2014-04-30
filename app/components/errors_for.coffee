ErrorsFor = Ember.Component.extend

  model: null

  errors: (->
    errors = []
    for fieldName,errorArray of @get('model.errors')
      errorArray.forEach (error) ->
        errors.push(fieldName.capitalize() + " " + error)
    errors
  ).property('model.errors')

  hasErrors: Ember.computed.notEmpty('errors.[]')

`export default ErrorsFor`
