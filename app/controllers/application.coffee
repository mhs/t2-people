`import Ember from "ember";`
ApplicationController = Ember.ArrayController.extend

  offices: Ember.computed.alias('content')


`export default ApplicationController;`
