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

  formStartDate: ((k, v) ->
    if arguments.length > 1
      @set('start_date', @deserializeDate(v))
    @serializeDate(@get('start_date'))
  ).property('start_date')

  formEndDate: ((k, v) ->
    if arguments.length > 1
      @set('end_date', @deserializeDate(v))
    @serializeDate(@get('end_date'))
  ).property('end_date')

  serializeDate: (d) ->
    App.DateTransform.create().serialize(d)
  deserializeDate: (d) ->
    App.DateTransform.create().deserialize(d)

  formData: ((serializedHash) ->
    data = new FormData()
    skipProperties = 'avatar office_slug current_allocation_id'.w()
    for prop, value of serializedHash
      unless skipProperties.contains(prop)
        # NOTE: formData expects either files, blobs or strings
        #       anything else will be converted to string, so
        #       null -> "null" ftl
        #       BUT also don't want to turn false -> ''
        if value == null
          value = ''
        data.append("person[#{prop}]", value)
    file = @get('avatarFile')
    if file
      data.append('person[avatar]', file)
    data
  )

  matches: (regex) ->
    props = 'name email twitter github'.w()
    props.any (term) =>
      item = @get(term)
      item && item.match(regex)


