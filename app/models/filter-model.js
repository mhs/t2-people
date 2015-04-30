import Ember from 'ember';

export default Ember.Object.extend({
  options: null,

  defaultOption: function() {
    return this.get('options').filterBy('isDefault', true).get('firstObject');
  }.property('options.@each.isDefault'),

  selectedOptions: function() {
    return this.get('options').filter(function(item) {
      return item.get('selected') && item.get('visible');
    });
  }.property('options', 'options.@each.selected', 'options.@each.visible'),

  filterFunc: function() {
    let options = this.get('selectedOptions');
    return function(record) {
      return options.any(function(option) {
        return option.get('filterFunc').call(option, record);
      });
    };
  }.property('selectedOptions'),

  select(slugs) {
    return this.selectOptions(function(option) {
      return slugs.contains(option.get('slug'));
    });
  },

  toggleSelect(option) {
    if (this.get('selectedOptions').contains(option)) {
      return this.removeSelect(option);
    } else {
      return this.addSelect(option);
    }
  },

  addSelect(option) {
    if (option === this.get('defaultOption')) {
      return this.reset();
    } else {
      return option.set('selected', true);
    }
  },

  removeSelect(option) {
    if (option === this.get('defaultOption')) {
      return;
    }
    return option.set('selected', false);
  },

  reset() {
    this.get('options').setEach('selected', false);
    return this.get('defaultOption').set('selected', true);
  },

  selectedSlugs: function() {
    return this.get('selectedOptions').mapProperty('slug');
  }.property('selectedOptions'),

  selectOptions(func) {
    return this.get('options').forEach(function(option) {
      return option.set('selected', func.call(this, option));
    });
  },

  fixSelection() {
    var selected;
    selected = this.get('selectedOptions');
    if (selected.get('length') === 0) {
      return this.reset();
    } else if (selected.get('length') > 1) {
      return this.get('defaultOption').set('selected', false);
    }
  },

  selectedOptionsDidChange: function() {
    return Ember.run.once(this, 'fixSelection');
  }.observes('options.@each.selected')
});
