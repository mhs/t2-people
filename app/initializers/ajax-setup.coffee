initializer =
  name: 'ajaxSetup'
  initialize: (container, application) ->
    auth = container.lookup("controller:authentication")
    Ember.$.ajaxSetup beforeSend: (xhr) ->
      xhr.setRequestHeader("Authorization", auth.get("accessToken"))
      xhr.setRequestHeader("x-Requested-With", "XMLHTTPRequest")

    $(document).ajaxError((event, jqXHR, ajaxSettings, thrownError) ->
      return unless jqXHR.getAllResponseHeaders()
      return if jqXHR.status == 422
      # HAX HAX HAX
      localStorage.removeItem('accessToken')
      return
      auth = container.lookup("controller:authentication")
      auth.logout()
    )

`export default initializer`
