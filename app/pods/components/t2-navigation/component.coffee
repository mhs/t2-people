`import Ember from "ember";`
`import ENV from "t2-people/config/environment";`

Component = Ember.Component.extend
  tagName: 'nav'
  classNames: ['global-header-navigation']

  topLinks: null
  bottomLinks: null

  didInsertElement: () ->
    url = ENV.apiHost + ENV.navBarUrl
    self = this
    $.getJSON(url, {}, (data, status, xhr) ->
      topLinks = Ember.ArrayProxy.create({content: data.top})
      current_link = topLinks.find((item) ->
        !!item.url.match(new RegExp(window.location.origin))
      )
      if (!current_link)
        current_link = topLinks.get('firstObject')
      if (!current_link.classes)
        current_link.classes = ''
      current_link.classes += ' selected-application'
      self.set('topLinks', topLinks)
      self.set('bottomLinks', Ember.ArrayProxy.create({content: data.bottom}))
    )

`export default Component;`
