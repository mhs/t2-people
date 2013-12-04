App.PeopleNewView = Ember.View.extend
  didInsertElement: ->
    $(@get('element')).on 'change', '.picture-upload input', (evt) =>
      fileField = evt.target
      @set('controller.avatarFile', fileField.files[0])

