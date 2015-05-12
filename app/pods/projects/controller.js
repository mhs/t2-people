import Ember from 'ember';
import promiseAction from 't2-people/utils/promise-action';
import ENV from 't2-people/config/environment';

export default Ember.Controller.extend({
  queryParams: ['page', 'office_id', 'archived'],
  page: 1,
  office_id: null,
  archived: false,
  searchResults: [],
  query: null,

  apiHost: (function() { return ENV.apiHost; }).property(),

  search: promiseAction(function(searchTerm) {
    this.store.find('projectListItem', { search: searchTerm }).then((results) => {
      this.set('searchResults', results);
    });
  }),

  selectedFilter: function() {
    return this.get('searchFilters.firstObject');
  }.property('searchFilters'),

  searchFilters: function() {
    return this.get('archivedFilters').concat(this.get('officeFilters'));
  }.property('archivedFilters', 'officeFilters'),

  filterSelectedObserver: function() {
    this.transitionToRoute({
      queryParams: this.get('selectedFilter.queryParams')
    });
  }.observes('selectedFilter'),

  officeFilters: function() {
    let allOffices = this.store.all('office');
    let offices    = allOffices.filter(function(office) {
      return !office.get('deleted');
    });

    return offices.map(function(office) {
      return Ember.Object.create({
        label: office.get('name'),
        value: office.get('id'),
        queryParams: {
          page: 1,
          archived: false,
          office_id: office.get('id')
        }
      });
    });
  }.property(),

  archivedFilters: function() {
    let active = Ember.Object.create({
      label: 'Active Projects',
      value: false,
      queryParams: {
        page: 1,
        archived: false,
        office_id: null
      }
    });

    let archived = Ember.Object.create({
      label: 'Archived Projects',
      value: true,
      queryParams: {
        page: 1,
        archived: true,
        office_id: null
      }
    });

    return [active, archived];
  }.property()
});
