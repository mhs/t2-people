App.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

App.ApplicationSerializer = DS.ActiveModelSerializer.extend()

App.RawTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized
  serialize: (deserialized) ->
    deserialized
