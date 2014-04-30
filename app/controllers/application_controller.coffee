App.ApplicationController = Ember.ArrayController.extend

  offices: Ember.computed.alias('content')

