`import Ember from "ember";`
`import { NO_OFFICE_ID } from "t2-people/utils/constants";`

PeopleNewController = Ember.Controller.extend
  needs: ['application']

  selectableOffices: Ember.computed.filter 'controllers.application.offices', (office) ->
    office.get('id') != NO_OFFICE_ID

  actions:
    save: (->
      model = @get('model')
      if model.get('errors')
        model.send('becameValid')
      model.save().then (=> @transitionToRoute 'people'), ((error) -> true)
    )

`export default PeopleNewController;`
