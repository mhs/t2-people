define(['application'], function (App) {
  App.SearchPeopleView = Ember.View.extend({
    actions: {
      search: function () {
        var keyword = encodeURIComponent(this.get('keyword'));
        this.get('controller').send('search', keyword);
      }
    },

    templateName: 'views/search_people',

    keyword: ''
  });
});
