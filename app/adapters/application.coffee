ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

  setupAjax: (->
    auth = @container.lookup("controller:authentication")
    Ember.$.ajaxSetup beforeSend: (xhr) ->
      xhr.setRequestHeader("Authorization", auth.get("accessToken"))
      xhr.setRequestHeader("x-Requested-With", "XMLHTTPRequest")
  ).on("init")

  ajaxError: (jqXHR) ->
    return unless jqXHR.getAllResponseHeaders()
    auth = @container.lookup("controller:authentication")
    auth.logout()

`export default ApplicationAdapter`

