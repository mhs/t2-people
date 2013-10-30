define(['application'], function (App) {
  App.SearchPeopleItemView = Ember.View.extend({
    templateName: 'views/search_people_item',

    commaSeparatedSkills: (function () {
      return this.get('person.skill_list').join(', ');
    }).property('person.skill_list'),

    twitterUrl: (function () {
      return 'http://twitter.com/' + this.get('person.twitter');
    }).property('person.twitter'),

    githubUrl: (function () {
      return 'http://github.com/' + this.get('person.github');
    }).property('person.github'),

    websiteUrl: (function () {
      var website = this.get('person.website');
      if (!!website && website.indexOf('http') != 0) {
        website = 'http://' + website;
      }
      return website;
    }).property('person.website'),

    emailUrl: (function () {
      return 'mailto://' + this.get('person.email');
    }).property('person.email')
  });
});
