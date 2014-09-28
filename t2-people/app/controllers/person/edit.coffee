`import Ember from "ember";`
`import { EMPLOYEE_ROLES } from "t2-people/utils/constants";`
PersonEditController = Ember.ObjectController.extend
  needs: ['application']

  employeeRoles: EMPLOYEE_ROLES

  actions:
    save: (->
      model = @get('model')
      if model.get('errors')
        model.send('becameValid')
      model.save().then (=> @transitionToRoute 'people'), ((error) ->)
    )

`export default PersonEditController;`
