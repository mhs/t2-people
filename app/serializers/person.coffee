`import DS from "ember-data";`
`import ApplicationSerializer from "t2-people/serializers/application";`

PersonSerializer = ApplicationSerializer.extend
  serializeIntoHash: (data, type, record, options) ->
    # return the FormData from record
    data['person'] = @generateFormData(@serialize(record))

  generateFormData: ((serializedHash) ->
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

`export default PersonSerializer;`
