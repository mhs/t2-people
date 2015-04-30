/*jshint unused:false */

import FilterModel from 't2-people/models/filter-model';
import FilterOption from 't2-people/services/filter-option';

export default FilterModel.extend({
  roles: [
    {
      value: 'Apprentice',
      display: 'are apprentices',
      slug: 'apprentices'
    }, {
      value: 'Business Development',
      display: 'do business development',
      slug: 'bd'
    }, {
      value: 'Designer',
      display: 'design',
      slug: 'design'
    }, {
      value: 'Developer',
      display: 'develop',
      slug: 'developer'
    }, {
      value: 'General & Administrative',
      display: 'administer',
      slug: 'admin'
    }, {
      value: 'Managing Director',
      display: 'are managing directors',
      slug: 'md'
    }, {
      value: 'Principal',
      display: 'are principals',
      slug: 'principal'
    }, {
      value: 'Product Manager',
      display: 'manage products',
      slug: 'product_manager'
    }, {
      value: 'Support Staff',
      display: 'support',
      slug: 'support'
    }
  ],

  options: (function() {
    let result = [];
    result.pushObject(FilterOption.create({
      displayName: 'are',
      slug: 'all_roles',
      isDefault: true,
      filterFunc(record) { return true; }
    }));

    this.roles.forEach(function(role) {
      return result.pushObject(FilterOption.create({
        displayName: role.display,
        slug: role.slug,
        data: role.value,
        filterFunc(record) { return record.get('role') === this.get('data'); }
      }));
    });

    return result;
  }).property('offices')
});
