import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'nav',
  classNames: 'will-paginate',
  data: null,
  route: null,
  page: Ember.computed.alias('data.meta.page'),
  total: Ember.computed.alias('data.meta.total'),

  displayMeta: function() {
    return this.get('total') > 1;
  }.property('total'),

  showPrevious: function() {
    return this.get('page') > 1;
  }.property('page'),

  showNext: function() {
    return this.get('page') < this.get('total');
  }.property('page'),

  nextPage: function() {
    return this.get('page') + 1;
  }.property('page'),

  previousPage: function() {
    return this.get('page') - 1;
  }.property('page')
});
