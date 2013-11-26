App.PeopleController = Ember.ArrayController.extend
  needs: ['application']
  officeFilter: null
  roleFilter: null

  office: null

  officeOptions: (->
    @get('controllers.application.offices').map (office) ->
      Ember.Object.create({ name: office.get('name'), value: office.get('id') })
  ).property('controllers.application.offices')
