ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

  ajaxError: (jqXHR) ->
    return unless jqXHR.getAllResponseHeaders()
    auth = @container.lookup("controller:authentication")
    auth.logout()

`export default ApplicationAdapter`

