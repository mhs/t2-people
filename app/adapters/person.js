import ApplicationAdapter from 't2-people/adapters/application';

export default ApplicationAdapter.extend({
  ajaxOptions: function(url, type, hash) {
    let result, savedData;
    if (hash && hash.data && hash.data.formData) {
      savedData = hash.data.formData;
      hash.data = {};
      result = this._super(url, type, hash);
      result.contentType = false;
      result.processData = false;
      result.data = savedData;
      return result;
    } else {
      return this._super(url, type, hash);
    }
  }
});
