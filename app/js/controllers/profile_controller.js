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

    emailLink: (function () {
      return 'mailto:' + this.get('person.email');
    }).property('person.email'),

    githubLink: (function () {
      return 'http://github.com/' + this.get('person.github');
    }).property('person.github'),

    twitterLink: (function () {
      return 'http://twitter.com/' + this.get('person.twitter');
    }).property('person.twitter')

  });
});
