module.exports = function(environment) {
  var ENV = {
    baseURL: '/',
    locationType: 'auto',
    navBarPath: '/api/v1/navbar',
    noOfficeId: '1000',
    noProjectId: '1000',
    employeeRoles: [
      'Apprentice',
      'Business Development',
      'Designer',
      'Developer',
      'General & Administrative',
      'Managing Director',
      'Principal',
      'Product Manager',
      'Support Staff'
    ],

    FEATURES: {
      'query-params-new': true
    }
  };

  if (environment === 'development') {
    ENV.apiHost = "http://localhost:5000";
  }

  if (environment === 'production') {}

  return ENV;
};

