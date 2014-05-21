RawTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized
  serialize: (deserialized) ->
    deserialized


DateTransform = DS.Transform.extend
  deserialize: (string) ->
    if !string
      null
    else
      [y, m, d] = string.split('-')
      new Date(y, m - 1, d)

  serialize: (date) ->
    if !date
      return null
    moment(date).format('YYYY-MM-DD')


initializer =
  name: 'customTransforms'
  after: 'transforms'
  initialize: (container, application) ->
    application.register('transform:date', DateTransform)
    application.register('transform:raw', RawTransform)

`export default initializer`

