module.exports = function(environment) {
  var ENV = {
    rootURL: '/',
    navBarPath: '/api/v1/navbar',
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

