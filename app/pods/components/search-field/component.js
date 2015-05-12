import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['search-and-new--input-container'],
  query: null,
  results: [],
  placeholder: 'Search',
  isSearching: false,
  debounce: 1000,
  requiredLength: 2,
  blankQuery: Ember.computed.empty('query'),

  validQuery: function() {
    return this.get('query.length') >= this.get('requiredLength');
  }.property('query', 'requiredLength'),

  queryObserver: function() {
    if (Ember.isEmpty(this.get('query'))) {
      this.set('results', []);
      return;
    }

    if(this.get('validQuery')) { return; }

    this.set('isSearching', true);
    let searchFunc = (()=> {
      this.search(this.get('query')).finally(()=> {
        this.set('isSearching', false);
      });
    });

    Ember.run.debounce(this, searchFunc, this.get('debounce'));
  }.observes('query', 'validQuery', 'debounce')
});
