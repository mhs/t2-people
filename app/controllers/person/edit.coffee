`import Ember from "ember";`
`import { EMPLOYEE_ROLES } from "t2-people/utils/constants";`
`import { NO_OFFICE_ID } from "t2-people/utils/constants";`
PersonEditController = Ember.ObjectController.extend
  needs: ['application']

  employeeRoles: EMPLOYEE_ROLES

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      if model.get('isError')
        model.send('becameValid')
      model.save().then (=> @transitionToRoute 'people'), ((error) ->)
    )

`export default PersonEditController;`
