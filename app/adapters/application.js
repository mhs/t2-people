import DS from 'ember-data';
import ENV from 't2-people/config/environment';

export default DS.ActiveModelAdapter.extend({
  namespace: 'api/v1',
  host: ENV.apiHost
});
