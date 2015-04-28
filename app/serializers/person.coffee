`import DS from "ember-data";`
`import ApplicationSerializer from "t2-people/serializers/application";`

PersonSerializer = ApplicationSerializer.extend
  serializeIntoHash: (data, type, snapshot, options) ->
    # return the FormData from record
    data['formData'] = @generateFormDataFromSnapshop(snapshot)

  generateFormDataFromSnapshop: (snapshot) ->
    serializedHash = @serialize(snapshot)
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

    file = snapshot.record.get('avatarFile')
    if file
      data.append('person[avatar]', file)

    data

`export default PersonSerializer;`
