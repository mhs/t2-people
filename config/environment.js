module.exports = function(environment) {
  var ENV = {
    rootURL: '/',
    navBarPath: '/api/v1/navbar',
    noOfficeId = '1000',
    noProjectId = '1000',
    employeeRoles = [
      'Apprentice',
      'Business Development',
      'Designer',
      'Developer',
      'General & Administrative',
      'Managing Director',
      'Principal',
      'Product Manager',
      'Support Staff'
    ]

    FEATURES: {
      // Here you can enable experimental featuers on an ember canary build
      // e.g. 'with-controller': true
    }
  };

  if (environment === 'development') {
    ENV.apiHost = "http://localhost:5000";
  }

  if (environment === 'production') {

  }

  return JSON.stringify(ENV); // Set in index.html
};

