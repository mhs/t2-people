define(['application'], function (App) {
  App.SearchController = Ember.Controller.extend({
    filteredPeople: (function () {
      var keyword = this.get('keyword');
      return this.get('people').filter(function (person) {
        return person.get('name').toLowerCase().indexOf(keyword) != -1;
      })
    }).property('people')
  });
});
