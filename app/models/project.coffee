`import DS from "ember-data";`
Project = DS.Model.extend
  name: DS.attr('string')
  offices: DS.hasMany('office')

  notes: DS.attr('string')
  slug: DS.attr('string')
  position: DS.attr('string')
  personIds: DS.attr()
  vacation: DS.attr('boolean')
  billable: DS.attr('boolean')

  sortOrder: (->
    val = 0
    if !@get('billable')
      val += 1
    if @get('vacation')
      val += 2
    val
  ).property('billable', 'vacation')

`export default Project;`
