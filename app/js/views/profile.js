define(
  [
    'application',
    'views/edit_profile_modal',
    'views/editable_skill_list'
  ],
  function (App) {
    App.ProfileView = Ember.View.extend({
      templateName: 'views/profile'
    });
  }
);
