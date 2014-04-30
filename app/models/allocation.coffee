Allocation = DS.Model.extend
  startDate: DS.attr('date')
  endDate: DS.attr('date')
  project: DS.belongsTo('project')
  person: DS.belongsTo('person')

  billable: DS.attr('boolean')
  percentAllocated: DS.attr('number')

  formatted_percentage: (->
    percent = @get('percentAllocated')
    if percent < 100
      "(#{percent}%)"
    else
      ''
  ).property('percentAllocated')

`export default Allocation`
