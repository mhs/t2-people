import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(collection, key) {
  let list = collection.map(function(item) {
    return item.get(key);
  }).join(', ');

  return new Ember.Handlebars.SafeString(list);
});
