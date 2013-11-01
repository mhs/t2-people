define(['application'], function (App) {
  App.ProfileController = Ember.Controller.extend({
    init: function () {
      this.set('editingSkills', false);
    },

    personData: (function () {
      var properties = this.get('person').getProperties([
        'name', 'title', 'bio', 'website', 'github', 'twitter', 'skill_list'
      ]);
      return Ember.Object.create(properties);
    }).property('person'),

    editable: true,
  });
});
