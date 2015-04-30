import Ember from 'ember';
import ENV from 't2-people/config/environment';

export default Ember.Component.extend({
  tagName: 'nav',
  classNames: ['global-header-navigation'],
  topLinks: null,
  bottomLinks: null,

  didInsertElement: function() {
    let url = ENV.apiHost + ENV.navBarUrl;

    return $.getJSON(url, {}, ((data)=> {
      let topLinks = Ember.ArrayProxy.create({ content: data.top });
      let current_link = topLinks.find(function(item) {
        return !!item.url.match(new RegExp(window.location.origin));
      });

      if (!current_link) { current_link = topLinks.get('firstObject'); }
      if (!current_link.classes) { current_link.classes = ''; }
      current_link.classes += ' selected-application';

      this.set('topLinks', topLinks);
      this.set('bottomLinks', Ember.ArrayProxy.create({ content: data.bottom }));
    }));
  }
});
