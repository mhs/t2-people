define(['application'], function (App) {
  App.SkillsView = Ember.View.extend({
    actions: {
      removeSkillFilter: function (filter) {
        this.get('controller.appliedSkillFilters').removeObject(filter);
      }
    },

    didInsertElement: function () {
      this.$('select').select2();
    },

    onSkillFilterChanged: (function () {
      var filter = this.get('controller.newSkillFilter');
      if (!filter) { return }
      this.get('controller.appliedSkillFilters').addObject(filter);
      this.$('select').select2('val', '');
    }).observes('controller.newSkillFilter')
  });
});