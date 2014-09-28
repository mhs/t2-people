`import Ember from "ember";`
EditDateComponent = Ember.TextField.extend
  focusIn: (event) ->
    @$().datepicker
      dateFormat: "yy-mm-dd"

`export default EditDateComponent;`
