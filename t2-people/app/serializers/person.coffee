`import DS from "ember-data";`
PersonSerializer = App.ApplicationSerializer.extend
  serializeIntoHash: (data, type, record) ->
    # return the FormData from record
    data.formData = record.formData(@serialize(record))


`export default PersonSerializer;`
