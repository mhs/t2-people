`import ApplicationSerializer from 'people/serializers/application'`

PersonSerializer = ApplicationSerializer.extend
  serializeIntoHash: (data, type, record) ->
    # return the FormData from record
    data.formData = record.formData(@serialize(record))

`export default PersonSerializer`
