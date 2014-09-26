ajaxInitializer =
  name: 'ajaxInitializer'

  initialize: (container, application) ->
    $.ajaxSetup beforeSend: (xhr) ->
      auth = container.lookup("controller:authentication")
      xhr.setRequestHeader("Authorization", auth.get('accessToken'))
      xhr.setRequestHeader("x-Requested-With", "XMLHTTPRequest")

    $(document).ajaxError( (event, jqXHR, ajaxSettings, thrownError) ->
      return if jqXHR.status == 422
      return unless jqXHR.getAllResponseHeaders()
      auth = container.lookup("controller:authentication")
      auth.logout()
    )

`export default ajaxInitializer;`
