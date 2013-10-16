define(['application'], function (App) {
  App.ProfileController = Ember.Controller.extend({

    actions: {
      'showEditModal': function () {
        this.set('showEditModal', true)
      }
    },

    emailLink: (function () {
      return 'mailto:' + this.get('person.email');
    }).property('person.email'),

    githubLink: (function () {
      return 'http://github.com/' + this.get('person.github');2
    }).property('person.github'),

    twitterLink: (function () {
      return 'http://twitter.com/' + this.get('person.twitter');
    }).property('person.twitter')

  });
});
