import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'span',
  startDate: null,
  endDate: null,
  format: 'YYYY/MM/DD',

  formattedStartDate: function() {
    if (this.get('startDate')) {
      return moment(this.get('startDate')).format(this.get('format'));
    }
  }.property('startDate'),

  formattedEndDate: function() {
    if (this.get('endDate')) {
      return moment(this.get('endDate')).format(this.get('format'));
    }
  }.property('endDate')
});
