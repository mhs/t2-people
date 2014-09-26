`import Ember from "ember";`
PersonEditView = Ember.View.extend
  didInsertElement: ->
    $(@get('element')).on 'change', '.avatar-picker input', (evt) =>
      fileField = evt.target
      file = fileField.files[0]
      @set('controller.avatarFile', file)
      reader = new FileReader()
      imageSetter = (anImage) ->
        (e) ->
          anImage.src = e.target.result

      img = $('.picture img')[0]
      reader.onload = imageSetter(img)
      reader.readAsDataURL(file)


`export default PersonEditView;`
