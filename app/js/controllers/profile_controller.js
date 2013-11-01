define(['application'], function (App) {
  App.ProfileController = Ember.Controller.extend({
    init: function () {
      this.set('editingSkills', false);
    },

    editable: true,
  });
});
