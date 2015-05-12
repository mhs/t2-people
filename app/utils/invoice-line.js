import Ember from 'ember';

export default Ember.Object.extend({
  project: null,
  key: '',

  investmentFridays: Ember.computed.alias('project.investmentFridays'),

  rate: function(_, value) {
    let property = "project.rates." + (this.get('key'));
    if (arguments.length > 1) {
      this.set(property, value);
    }
    return this.get(property);
  }.property('project.rates', 'key'),

  allocationPercent: function(_, value) {
    let property = "project.typicalAllocationPercentages." + (this.get('key'));
    if (arguments.length > 1) {
      this.set(property, value);
    }
    return this.get(property);
  }.property('project.typicalAllocationPercentages', 'key'),

  count: function(_, value) {
    let property = "project.typicalCounts." + (this.get('key'));
    if (arguments.length > 1) {
      this.set(property, value);
    }
    return this.get(property);
  }.property('project.typicalCounts', 'key'),

  equivalentDayRate: function() {
    let rate = this.get('rate');
    if (!rate) { return 0.0; }

    if (this.get('investmentFridays')) {
      return rate / 4.0;
    } else {
      return rate / 5.0;
    }
  }.property('rate', 'investmentFridays'),

  equivalentHourlyRate: function() {
    return (this.get('equivalentDayRate') / 8.0) || 0.0;
  }.property('equivalentDayRate'),

  perInvoice: function() {
    let value = this.get('rate') * this.get('count') * this.get('allocationPercent') / 100.0;
    return value || 0.0;
  }.property('rate', 'count', 'allocationPercent')
});
