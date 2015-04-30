import Ember from 'ember';
import OfficesFilter  from 't2-people/models/filters/offices-filter';
import ProjectsFilter from 't2-people/models/filters/projects-filter';
import RolesFilter    from 't2-people/models/filters/roles-filter';

export default Ember.Controller.extend({
  needs: ['application'],
  queryParams: ['projects', 'offices', 'roles', 'search'],

  projects: '',
  offices: '',
  roles: '',
  search: '',
  searchTerm: null,

  officeFilterModel: function() {
    return OfficesFilter.create({
      offices: this.get('controllers.application.offices')
    });
  }.property('controllers.application.offices'),

  projectFilterModel: function() {
    return ProjectsFilter.create({
      projects: this.store.all('project'),
      officeFilterModel: this.get('officeFilterModel')
    });
  }.property(),

  roleFilterModel: function() {
    return RolesFilter.create();
  }.property(),

  queryParamsDidChange: function() {
    this.get('officeFilterModel').select(this.get('offices').split(','));
    this.get('projectFilterModel').select(this.get('projects').split(','));
    this.get('roleFilterModel').select(this.get('roles').split(','));
  }.observes('offices', 'projects', 'roles'),

  personMatchesSearch: function(person, regex) {
    return ['name', 'email', 'twitter', 'github'].any((term) => {
      return person.get(term) && person.get(term).match(regex);
    });
  },

  filteredPeople: function() {
    let searchRegex   = new RegExp(this.get('searchTerm') || '', 'i');
    let officeFilter  = this.get('officeFilterModel');
    let officeFunc    = officeFilter.get('filterFunc');

    let projectFilter = this.get('projectFilterModel');
    let projectFunc   = projectFilter.get('filterFunc');

    let roleFilter    = this.get('roleFilterModel');
    let roleFunc      = roleFilter.get('filterFunc');

    let officePeople  = this.get('model').filter(function(record) {
      return officeFunc.call(officeFilter, record) && projectFunc.call(projectFilter, record) && roleFunc.call(roleFilter, record);
    }).filter((item)=> {
      return this.personMatchesSearch(item, searchRegex);
    });

    return Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, {
      sortProperties: ['name'],
      content: officePeople
    });
  }.property(
    'model.@each.isNew',
    'officeFilterModel.selectedOptions',
    'projectFilterModel.selectedOptions',
    'roleFilterModel.selectedOptions',
    'searchTerm'
  ),

  filterBeingUsed: function() {
    return [
      this.get('officeFilterModel.selectedOptions').any(function(o)  { return (o.hasOwnProperty('isDefault') && o.isDefault); }),
      this.get('projectFilterModel.selectedOptions').any(function(o) { return (o.hasOwnProperty('isDefault') && o.isDefault); }),
      this.get('roleFilterModel.selectedOptions').any(function(o)    { return (o.hasOwnProperty('isDefault') && o.isDefault); })
    ].any(function(value) { return !value; });
  }.property(
    'officeFilterModel.selectedOptions.[]',
    'projectFilterModel.selectedOptions.[]',
    'roleFilterModel.selectedOptions.[]'
  ),

  syncSearch() {
    this.set('searchTerm', this.get('search'));
  },

  updateSearch: function() {
    Ember.run.debounce(this, this.syncSearch, 300);
  }.observes('search'),

  selectedOfficeSlugs:  Ember.computed.alias('officeFilterModel.selectedSlugs'),
  selectedProjectSlugs: Ember.computed.alias('projectFilterModel.selectedSlugs'),
  selectedRoleSlugs:    Ember.computed.alias('roleFilterModel.selectedSlugs'),

  setQueryParams: function() {
    if (!this.get('controllers.application.currentRouteName')) { return; }

    Ember.run.once(this, function() {
      this.transitionToRoute({
        queryParams: {
          offices:  this.get('selectedOfficeSlugs').join(','),
          projects: this.get('selectedProjectSlugs').join(','),
          roles:    this.get('selectedRoleSlugs').join(',')
        }
      });
    });
  }.observes(
    'officeFilterModel.options.@each.selected',
    'projectFilterModel.options.@each.selected',
    'roleFilterModel.options.@each.selected'
  ),

  actions: {
    clearAllFilters() {
      this.get('officeFilterModel').reset();
      this.get('projectFilterModel').reset();
      this.get('roleFilterModel').reset();
    }
  }
});
