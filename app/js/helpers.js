define(['application'], function (App) {
  App.Raw2EmberObject = function (rawObject) {

    /* Recursively transform deep properties
       into Ember.Object(s) */
    for (var i in rawObject) {
      if (rawObject.hasOwnProperty(i)) {
        if (Ember.typeOf(rawObject[i]) === 'object') {
          rawObject[i] = App.Raw2EmberObject(rawObject[i]);
        }
        else if (Ember.typeOf(rawObject[i]) === 'array') {
          rawObject[i] = rawObject[i].map(App.Raw2EmberObject);
        }
      }
    }

    return Ember.Object.create(rawObject);
  }
})
