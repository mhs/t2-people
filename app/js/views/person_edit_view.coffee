App.PersonEditView = Ember.View.extend
  didInsertElement: ->
    $(@get('element')).on 'change', '.avatar-picker input', (evt) =>
      debugger
      fileField = evt.target
      @set('controller.avatarFile', fileField.files[0])
