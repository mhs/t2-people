/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 't2-people',
    podModulePrefix: 't2-people/pods',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    contentSecurityPolicy: {
      'default-src': "'none'",
      'font-src': "'self' http://fonts.gstatic.com", // Allow fonts to be loaded from http://fonts.gstatic.com
      'img-src': "'self' data: https://t2-data.s3.amazonaws.com/ http://s3.amazonaws.com/",
      'style-src': "'self' 'unsafe-inline' http://fonts.googleapis.com", // Allow inline styles and loaded CSS from http://fonts.googleapis.com
      'media-src': "'self'"
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.apiHost = "http://localhost:5000"
    ENV.navBarUrl = "/api/v1/navbar"
    ENV.contentSecurityPolicy['connect-src'] = "'self' http://localhost:5000";
  }

  if (environment === 'staging') {
    ENV.apiHost = "https://t2-api-staging.herokuapp.com";
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
    ENV.contentSecurityPolicy['connect-src'] = "'self'";
  }

  if (environment === 'production') {
    ENV.apiHost = "https://t2-api.herokuapp.com";
    ENV.navBarUrl = "/api/v1/navbar"

    ENV.contentSecurityPolicy['connect-src'] = "'self' https://api.mixpanel.com http://custom-api.local";
  }

  return ENV;
};
