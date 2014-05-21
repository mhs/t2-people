EditDateView = Ember.TextField.extend

  focusIn: (event) ->
    @$().datepicker
      dateFormat: "yy-mm-dd"

Ember.Handlebars.helper('edit-date', App.EditDateView)

`export default EditDateView`
