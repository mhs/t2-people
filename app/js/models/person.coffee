attr = DS.attr

App.Person = DS.Model.extend
  name: attr('string')
  role: attr('string')
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
  currentAllocation: DS.belongsTo('allocation')

  firstName: (->
    @get('name').split(' ')[0]
  ).property('name')

  # expects an object that FormData will be cool with
  avatarFile: null

  formData: (->
    all_props = 'name role notes email unsellable start_date end_date github twitter website title bio'.w()
    data = new FormData()
    values = @getProperties(all_props...)
    for prop in all_props
      data.append("person[#{prop}]", values[prop]) unless values[prop] == undefined
    file = @get('avatarFile')
    if file
      data.append('person[avatar]', file)
    data.append('person[office_id]', @get('office.id'))
    data
  )

