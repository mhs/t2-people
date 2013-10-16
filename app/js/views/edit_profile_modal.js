define(["application"], function(App) {
  App.EditProfileModalView = Ember.View.extend({
    actions: {
      save: function () {
        var person = this.get('controller.person')
          , personData = this.get('controller.personData')
          , newProperties = personData.getProperties([
              'name', 'title', 'bio', 'website', 'github', 'twitter'
            ]);

        /* Hide modal. */
        this.$('#edit_profile_modal').modal('hide');

        /* Save profile changes. */
        person.setProperties(newProperties);
      }
    },

    templateName: 'views/edit_profile_modal'
  });
});