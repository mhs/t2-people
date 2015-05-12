import Ember from 'ember';
import InvoiceLine from 't2-people/utils/invoice-line';
var _ref;

let invoiceKeys = [
  'developer.perInvoice',
  'designer.perInvoice',
  'principal.perInvoice',
  'productManager.perInvoice'
];

export default Ember.Object.extend({
  project: null,
  developer: function() {
    return InvoiceLine.create({
      project: this.get('project'),
      key: 'developer'
    });
  }.property('project'),

  designer: function() {
    return InvoiceLine.create({
      project: this.get('project'),
      key: 'designer'
    });
  }.property('project'),

  principal: function() {
    return InvoiceLine.create({
      project: this.get('project'),
      key: 'principal'
    });
  }.property('project'),

  productManager: function() {
    return InvoiceLine.create({
      project: this.get('project'),
      key: 'productManager'
    });
  }.property('project'),

  total: (_ref = (function() {
    var amounts, key, total, _i, _len;
    amounts = this.getProperties.apply(this, invoiceKeys);
    total = 0.0;
    for (_i = 0, _len = invoiceKeys.length; _i < _len; _i++) {
      key = invoiceKeys[_i];
      total += amounts[key];
    }
    return total;
  })).property.apply(_ref, invoiceKeys)
});
