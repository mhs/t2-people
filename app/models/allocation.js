import DS from 'ember-data';

export default DS.Model.extend({
  person: DS.belongsTo('person'),
  project: DS.belongsTo('project', { async: true }),

  billable: DS.attr('boolean'),
  endDate: DS.attr('date'),
  percentAllocated: DS.attr('number'),
  startDate: DS.attr('date'),

  formattedPercentage: (function() {
    if (this.get('percentAllocated') < 100) {
      return '(' + this.get('percentAllocated') + '%)';
    } else {
      return '';
    }
  }).property('percentAllocated')
});
