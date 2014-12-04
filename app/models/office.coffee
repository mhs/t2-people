`import Ember from "ember";`
`import DS from "ember-data";`
Office = DS.Model.extend
  name: DS.attr('string')
  projects: DS.hasMany('project')
  notes: DS.attr('string')
  slug: DS.attr('string')
  position: DS.attr('number')
  personIds: DS.attr()

  value: Ember.computed.alias('id')

`export default Office;`
