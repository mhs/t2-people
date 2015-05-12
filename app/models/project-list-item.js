import DS from 'ember-data';

export default DS.Model.extend({
  offices: DS.hasMany('office'),
  sellingOffice: DS.belongsTo('office'),

  endDate: DS.attr('date'),
  investmentFridays: DS.attr('boolean'),
  name: DS.attr('string'),
  startDate: DS.attr('date')
});
