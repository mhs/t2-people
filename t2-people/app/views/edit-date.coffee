`import Ember from "ember";`
EditDateView = Ember.TextField.extend
  focusIn: (event) ->
    @$().datepicker
      dateFormat: "yy-mm-dd"

`export default EditDateView;`
