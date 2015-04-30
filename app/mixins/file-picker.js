import Ember from 'ember';

export default Ember.Mixin.create({
  bindFilePickerEvent: function() {
    this.$().on('change', '#avatar-file-picker', (event)=> {
      let file = event.target.files[0];
      this.set('controller.model.avatarFile', file);
      let reader = new FileReader();
      let imageSetter = function(anImage) {
        return function(e) {
          return anImage.src = e.target.result;
        };
      };

      let img = $('.picture img')[0];
      reader.onload = imageSetter(img);
      reader.readAsDataURL(file);
    });
  }.on('didInsertElement'),

  teardownFilePickerEvent: function() {
    return this.$().off('change');
  }.on('willDestroyElement')
});
