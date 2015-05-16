import Ember from 'ember';
import { NO_OFFICE_ID } from 't2-people/constants';
import { EMPLOYEE_ROLES } from 't2-people/constants';

export default Ember.Controller.extend({
  needs: ['application'],
  employeeRoles: EMPLOYEE_ROLES,

  selectableOffices: Ember.computed.filter('controllers.application.offices', function(office) {
    return office.get('id') !== NO_OFFICE_ID;
  }),

  actions: {
    save() {
      this.get('model').save().then(()=> {
        this.transitionToRoute('people');
      }, () => {
        return true;
      });
    }
  }
});
