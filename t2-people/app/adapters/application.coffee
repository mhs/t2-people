`import DS from "ember-data";`
`import ENV fom "t2-people/config/environment";`
ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api/v1'
  host: window.ENV.apiHost

`export default ApplicationAdapter;`
