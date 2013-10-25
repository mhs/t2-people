define(['application'], function (App) {
  App.SkillsController = Ember.Controller.extend({
    people: (function () {
      var people = [];
      this.get('skills').forEach(function (skill) {
        people.addObject(skill.get('person'));
      });
      return people;
    }).property('skills')
  });
})