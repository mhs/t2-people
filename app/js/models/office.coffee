App.Office = DS.Model.extend
  name: DS.attr('string')
  slug: (->
    @get('name').replace(/\s+/, '-').toLowerCase()
  ).property('name')

  value: (->
    @get('id')
  ).property('id')
