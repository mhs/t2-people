import Auth from 't2-people/services/authentication';

export default {
  name: 'authentication',

  initialize: function(container, application) {
    container.register('authentication:main', Auth);
    application.inject('route', 'authentication', 'authentication:main');
  }
};

