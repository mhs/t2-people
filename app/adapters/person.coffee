`import ApplicationAdapter from 't2-people/adapters/application'`

PersonAdapter = ApplicationAdapter.extend
  ajaxOptions: (url, type, hash) ->
    # return contentType: false + needed options
    # hang on to the data since super will try to stringify it
    if hash?.data?.formData?
      savedData = hash.data.formData
      hash.data = {}
      result = @_super(url, type, hash)
      result.contentType = false
      result.processData = false
      result.data = savedData
      result
    else
      @_super(url, type, hash)

`export default PersonAdapter`
