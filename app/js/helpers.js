define(['application'], function (App) {
  App.Raw2EmberObject = function (object) {
    return Ember.Object.create(object);
  }
})