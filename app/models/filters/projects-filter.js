import Ember from 'ember';
import FilterModel from 't2-people/models/filter-model';
import FilterOption from 't2-people/services/filter-option';

export default FilterModel.extend({
  projects: null,
  officeFilterModel: null,

  options: function() {
    let filters = {
      currentEmployee: function(record) {
        let date = record.get('end_date');
        return !date || date >= new Date();
      },
      exEmployee: function(record) {
        let date = record.get('end_date');
        return !!date && date < new Date();
      },
      notAllocated: function(record) {
        return !record.get('unsellable') && !record.get('allocated');
      },
      onOverhead: function(record) {
        return record.get('percentBillable') < 100;
      },
      onPto: function(record) {
        return record.get('currentAllocations').mapBy('project.vacation').any(function(val) {
          return val;
        });
      },
      onBillable: function(record) {
        return record.get('currentAllocations').mapBy('billable').any(function(val) {
          return val;
        });
      }
    };

    let result = [];
    result.pushObject(FilterOption.create({
      displayName: 'Anything',
      slug: 'all_projects',
      isDefault: true,
      filterFunc: function(record) {
        return filters.currentEmployee(record);
      }
    }));
    result.pushObject(FilterOption.create({
      displayName: 'Overhead',
      slug: 'overhead',
      isDefault: false,
      filterFunc: function(record) {
        return filters.currentEmployee(record) && filters.onOverhead(record);
      }
    }));
    result.pushObject(FilterOption.create({
      displayName: 'Available',
      slug: 'on_bench',
      isDefault: false,
      filterFunc: function(record) {
        return filters.currentEmployee(record) && filters.notAllocated(record);
      }
    }));
    result.pushObject(FilterOption.create({
      displayName: 'PTO',
      slug: 'pto',
      isDefault: false,
      filterFunc: function(record) {
        return filters.currentEmployee(record) && filters.onPto(record);
      }
    }));
    result.pushObject(FilterOption.create({
      displayName: 'Billable Projects',
      slug: 'billable',
      isDefault: false,
      filterFunc: function(record) {
        return filters.currentEmployee(record) && filters.onBillable(record);
      }
    }));
    result.pushObject(FilterOption.create({
      displayName: 'Are No Longer With The Company',
      slug: 'gone',
      isDefault: false,
      filterFunc: function(record) {
        return filters.exEmployee(record);
      }
    }));

    let projects = this.get('projects').filter(function(project) {
      return project.get('name');
    }) || [];

    let sortByName = {
      sortProperties: ['sortOrder', 'name'],
      content: projects
    };

    projects = Ember.ArrayProxy.createWithMixins(Ember.SortableMixin, sortByName);

    projects.forEach(function(project) {
      return result.pushObject(FilterOption.create({
        displayName: project.get('name'),
        slug: project.get('id'),
        data: project,
        filterFunc(record) {
          let ourProject = this.get('data');
          return record.get('currentAllocations').mapBy('project.content').any(function(r_project) {
            return r_project === ourProject;
          });
        }
      }));
    });

    return result;
  }.property('projects.@each.name'),

  officeSelectionDidChange: (function() {
    let offices = this.get('officeFilterModel.selectedOptions').mapBy('data');
    if (offices.contains(null)) {
      return this.get('options').setEach('visible', true);
    } else {
      return this.get('options').forEach(function(option) {
        let visible = !option.data || offices.any(function(item) {
          return option.data.get('offices').contains(item);
        });
        return option.set('visible', visible);
      });
    }
  }).observes('officeFilterModel.options.@each.selected').on('init')
});
