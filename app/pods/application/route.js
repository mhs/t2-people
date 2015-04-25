import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function(transition) {
    let auth = this.get('authentication');
    auth.extractAccessToken();

    if (!auth.get('isAuthenticated')) {
      transition.abort();
      auth.login();
    }

    return Ember.RSVP.all([this.store.find('office'), this.store.find('person'), this.store.find('project')]);
  },

  model: function() {
    // TODO: Do we still need to filter in Data beta.0.16?
    return this.store.all('office').filter(function(office) {
      return !office.get('deleted');
    });
  },

  actions: {
    newPerson() {
      this.transitionTo('people.new');
    }
  }
});
