`import Ember from "ember";`
`import { NO_OFFICE_ID } from "t2-people/utils/constants";`
`import { EMPLOYEE_ROLES } from "t2-people/utils/constants";`

PeopleNewController = Ember.Controller.extend
  needs: ['application']

  employeeRoles: EMPLOYEE_ROLES

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      model.save().then (=> @transitionToRoute 'people'), ((error) -> true)
    )

`export default PeopleNewController;`
