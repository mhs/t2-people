import Ember from 'ember';

let contentAttr = function(name) {
  return function(_, v) {
    if (arguments.length > 1) {
      this.get('content')[name] = v;
    }
    return this.get('content')[name];
  }.property();
};

export default Ember.ObjectProxy.extend({
  developer: contentAttr('Developer'),
  designer: contentAttr('Designer'),
  principal: contentAttr('Principal'),
  productManager: contentAttr('Product Manager')
});
