import Ember from 'ember';
import ENV from 't2-people/config/environment';

export default Ember.Object.extend({
  accessToken: null,

  isAuthenticated: Ember.computed.notEmpty('accessToken'),

  extractAccessToken() {
    let match = location.href.match(/authentication_token=([a-zA-Z0-9_-]+)/);

    if (match) {
      this.set('accessToken', match[1]);
      location.href = location.origin;
    }
  },

  login() {
    this._redirectToSignIn();
  },

  logout() {
    this.set('accessToken', null);
    this._redirectToSignOut();
  },

  currentUser: function() {
    let person = {};

    Ember.$.ajax({
      async: false,
      url: ENV.apiHost + '/profile.json',
      dataType: 'json',
      data: {},
      success: function(data) {
        person = data.person;
      }
    });

    return person;
  }.property('accessToken'),

  _getAccessTokenFromLocalStorage: function() {
    this.set('accessToken', localStorage.accessToken);
  }.on('init'),

  _redirectTo(url) {
    location.href = url += '?return_url=' + window.escape(location.href);
  },

  _redirectToSignIn() {
    return this._redirectTo(ENV.apiHost + '/sign_in');
  },

  _redirectToSignOut() {
    return this._redirectTo(ENV.apiHost + '/sign_out');
  },

  _accessTokenDidChange: function() {
    let token = this.get('accessToken');

    if (token) {
      localStorage.accessToken = token;
    } else {
      delete localStorage.accessToken;
    }
  }.observes('accessToken'),
});
