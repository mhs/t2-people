import DS from 'ember-data';
import RoleMap from 't2-people/utils/role-map';
import TypicalInvoice from 't2-people/utils/typical-invoice';

export default DS.Model.extend({
  offices: DS.hasMany('office', {inverse: 'projects'}),
  people: DS.hasMany('person'),
  sellingOffice: DS.belongsTo('office'),

  billable: DS.attr('boolean', { defaultValue: true }),
  endDate: DS.attr('date'),
  investmentFridays: DS.attr('boolean', { defaultValue: true }),
  name: DS.attr('string'),
  startDate: DS.attr('date'),
  vacation: DS.attr('boolean'),
  rates: DS.attr('roleMap', {
    defaultValue: function() {
      return RoleMap.create({
        content: {
          'Developer': 7000,
          'Designer': 7000,
          'Principal': 14000,
          'Product Manager': 7000
        }
      });
    }
  }),

  sortOrder: function() {
    let val = 0;

    if (!this.get('billable')) {
      val += 1;
    }
    if (this.get('vacation')) {
      val += 2;
    }

    return val;
  }.property('billable', 'vacation'),

  typicalInvoice: function() {
    return TypicalInvoice.create({ project: this });
  }.property('rates')
});
