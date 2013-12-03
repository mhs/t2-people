attr = DS.attr
App.Person = DS.Model.extend
  name: attr('string')
  notes: attr('string')
  email: attr('string')
  unsellable: attr('boolean')
  start_date: attr('date')
  end_date: attr('date')
  github: attr('string')
  twitter: attr('string')
  website: attr('string')
  title: attr('string')
  bio: attr('string')
  office_slug: attr('string')
  avatar: attr('raw')
  office: DS.belongsTo('office')

  firstName: (->
    @get('name').split(' ')[0]
  ).property('name')
