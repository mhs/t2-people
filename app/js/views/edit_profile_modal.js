define(["application"], function(App) {
  App.EditProfileModalView = Ember.View.extend({
    actions: {
      save: function () {
        var person = this.get('controller.person')
          , personData = this.get('controller.personData')
          , properties = ['name', 'title', 'bio', 'website', 'github', 'twitter']
          , newProperties = personData.getProperties(properties);

        /* Hide modal. */
        this.$('#edit_profile_modal').modal('hide');

        var data = new FormData();

        properties.forEach(function (i) {
          data.append("person[" + i + "]", newProperties[i]);
        });

        var file = this.$('input[type=file]')[0].files[0]
        data.append('person[avatar]', file || null);

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: data,
          contentType: false,
          processData: false
        }).done(function () {
          person.setProperties(newProperties);
        });
      }
    },

    templateName: 'views/edit_profile_modal'
  });
});
