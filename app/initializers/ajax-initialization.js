/*jshint unused:false */

export default {
  name: 'ajaxInitializer',
  after: 'authentication',

  initialize: function(container, application) {
    let auth = container.lookup('authentication:main');

    $.ajaxSetup({
      beforeSend: function(xhr) {
        xhr.setRequestHeader('Authorization', auth.get('accessToken'));
        xhr.setRequestHeader('x-Requested-With', 'XMLHTTPRequest');
      }
    });

    $(document).ajaxError(function(event, jqXHR, ajaxSettings, thrownError) {
      if (jqXHR.status === 422) { return; }
      if (!jqXHR.getAllResponseHeaders()) { return; }

      auth.logout();
    });
  }
};
