`import Ember from "ember";`
ErrorsForComponent = Ember.Component.extend

  model: null

  errors: (->
    @get('model.errors')
  ).property('model.errors')

  hasErrors: Ember.computed.notEmpty('errors.[]')

`export default ErrorsForComponent;`
