import Ember from 'ember';

export default Ember.TextField.extend({
  focusIn() {
    this.$().datepicker({
      dateFormat: 'yy-mm-dd'
    });
  }
});
