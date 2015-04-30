import DS from 'ember-data';

export default DS.Transform.extend({
  deserialize: function(string) {
    if (!string) { return null; }

    let _ref = string.split('-'), y = _ref[0], m = _ref[1], d = _ref[2];
    return new Date(y, m - 1, d);
  },

  serialize: function(date) {
    if (!date) { return null; }
    return moment(date).format('YYYY-MM-DD');
  }
});
