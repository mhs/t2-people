define(
  [
    'application',
    'views/edit_profile_modal',
    'views/editable_skill_list'
  ],
  function (App) {
    App.ProfileView = Ember.View.extend({
      templateName: 'views/profile',

      personData: (function () {
        var properties = this.get('controller.person').getProperties([
          'name', 'title', 'bio', 'website', 'github', 'twitter', 'skill_list'
        ]);
        return Ember.Object.create(properties);
      }).property('controller.person'),

      emailLink: (function () {
        return 'mailto:' + this.get('controller.person.email');
      }).property('controller.person.email'),

      githubLink: (function () {
        return 'http://github.com/' + this.get('controller.person.github');
      }).property('controller.person.github'),

      twitterLink: (function () {
        return 'http://twitter.com/' + this.get('controller.person.twitter');
      }).property('controller.person.twitter'),

      websiteLink: (function () {
        var website = this.get('controller.person.website');
        if (!!website && website.indexOf('http') == -1) {
          website = 'http://' + website;
        }
        return website;
      }).property('controller.person.website')
    });
  }
);
