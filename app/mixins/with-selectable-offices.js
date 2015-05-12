import Ember from 'ember';
import SelectableOffice from 't2-people/utils/selectable-office';

export default Ember.Mixin.create({
  selectedOffices: function() {
    let allOffices = this.store.all('office');
    let offices    = allOffices.filter(function(office) {
      return !office.get('deleted');
    });

    return offices.map(function(office) {
      return SelectableOffice.create({
        project: this.get('model'),
        office: office
      });
    });
  }.property('model')
});
