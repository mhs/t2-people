define(["application"], function(App) {
  App.EditProfileModalView = Ember.View.extend({
    actions: {
      save: function () {
        var view = this
          , controller = view.get('controller')
          , personData = view.get('controller.personData')
          , properties = ['name', 'title', 'bio', 'website', 'github', 'twitter']
          , newProperties = personData.getProperties(properties);

        var data = new FormData();

        properties.forEach(function (i) {
          data.append("person[" + i + "]", newProperties[i]);
        });

        var file = view.$('input[type=file]')[0].files[0]
        data.append('person[avatar]', file || null);

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: data,
          contentType: false,
          processData: false
        }).done(function (data) {
          controller.set('person', Ember.Object.create(data.person));
          view.$('#edit_profile_modal').modal('hide');
        });
      }
    },

    templateName: 'views/edit_profile_modal'
  });
});
