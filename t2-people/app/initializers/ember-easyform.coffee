`import Ember from "ember";`
`import "vendor/js/ember-easyForm";`
formInitializer =
  name: 'easyForm'
  initialize: (container, app) ->
    options = {}
    Ember.EasyForm.Config.registerWrapper('default', options)

`export default formInitializer;`
