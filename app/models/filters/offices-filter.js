/*jshint unused:false */

import FilterModel from 't2-people/models/filter-model';
import FilterOption from 't2-people/services/filter-option';

export default FilterModel.extend({
  offices: null,
  options: function() {
    let result = [];
    result.pushObject(FilterOption.create({
      displayName: 'Team Human',
      slug: 'all_offices',
      isDefault: true,
      filterFunc(record) { return true; }
    }));

    let offices = this.get('offices') || [];
    offices.forEach(function(office) {
      return result.pushObject(FilterOption.create({
        displayName: office.get('name'),
        slug: office.get('slug'),
        data: office,
        filterFunc(record) { return record.get('office') === this.get('data'); }
      }));
    });

    return result;
  }.property('offices')
});
