import DS from 'ember-data';

export default DS.Model.extend({
  offices: DS.hasMany('office'),

  billable: DS.attr('boolean'),
  name: DS.attr('string'),
  vacation: DS.attr('boolean'),

  sortOrder: (function() {
    let val = 0;

    if (!this.get('billable')) {
      val += 1;
    }
    if (this.get('vacation')) {
      val += 2;
    }

    return val;
  }).property('billable', 'vacation')
});
