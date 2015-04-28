`import Ember from "ember";`
`import DS from "ember-data";`
Office = DS.Model.extend
  name: DS.attr('string')
  projects: DS.hasMany('project')
  deleted: DS.attr('boolean')

  slug: (->
    @get('name').replace(/\s+/, '-').toLowerCase()
  ).property('name')

  value: Ember.computed.alias('id')

`export default Office;`
