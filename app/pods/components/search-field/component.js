import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['search-field'],
  query: null,
  results: [],
  placeholder: 'Search',
  isSearching: false,
  debounce: 1000,
  requiredLength: 2,
  blankQuery: Ember.computed.empty('query'),

  validQuery: (function() {
    return this.get('query.length') >= this.get('requiredLength');
  }).property('query', 'requiredLength'),

  queryObserver: (function() {
    if (this.get('blankQuery')) {
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
  }).observes('query', 'blankQuery', 'validQuery', 'debounce')
});
