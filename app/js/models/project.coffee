App.Project = DS.Model.extend
  name: DS.attr('string')
  offices: DS.hasMany('office')

  vacation: DS.attr('boolean')
  billable: DS.attr('boolean')

  value: Ember.computed.alias('id')
