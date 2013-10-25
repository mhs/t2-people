define(['application'], function (App) {
  App.SkillsController = Ember.Controller.extend({
    appliedSkillFilters: [],

    onAppliedSkillFiltersChange: (function () {
      if (this.get('appliedSkillFilters.length') === 0) {
        this.set('skillFilters', this.get('skills'));
      }
      else {
        this.set('skillFilters', this.get('appliedSkillFilters'));
      }
    }).observes('appliedSkillFilters.[]'),

    people: (function () {
      var people = [];
      this.get('skillFilters').forEach(function (skill) {
        /* TODO: Use [].flatten maybe */
        skill.get('people').forEach(function (person) {
          if (!people.filterBy('id', person.get('id')).length) {
            people.addObject(person);
          }
        })
      });
      return people;
    }).property('skillFilters.[]')
  });
})
