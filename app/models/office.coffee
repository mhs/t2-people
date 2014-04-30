Office = DS.Model.extend
  name: DS.attr('string')
  projects: DS.hasMany('project')
  slug: (->
    @get('name').replace(/\s+/, '-').toLowerCase()
  ).property('name')

  value: Ember.computed.alias('id')

`export default Office`
