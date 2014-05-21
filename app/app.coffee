`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  LOG_STACKTRACE_ON_DEPRECATION : true,
  LOG_BINDINGS                  : true,
  LOG_TRANSITIONS               : true,
  LOG_TRANSITIONS_INTERNAL      : true,
  LOG_VIEW_LOOKUPS              : true,
  LOG_ACTIVE_GENERATION         : true,
  modulePrefix                  : 't2-people',
  Resolver                      : Resolver

loadInitializers(App, 't2-people')

`export default App`
