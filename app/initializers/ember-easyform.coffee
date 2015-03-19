`import Ember from "ember";`

formInitializer =
  name: 'easyForm'
  initialize: (container, app) ->
    options = {}
    Ember.EasyForm.Config.registerWrapper('default', options)

`export default formInitializer;`
