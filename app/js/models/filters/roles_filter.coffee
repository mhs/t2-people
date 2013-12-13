App.RolesFilter = App.FilterModel.extend

  roles: [
    {
      value: 'Apprentice'
      display: 'are apprentices'
      slug: 'apprentices'
    },
    {
      value: 'Business Development'
      display: 'do business development'
      slug: 'bd'
    },
    {
      value: 'Designer'
      display: 'design'
      slug: 'design'
    },
    {
      value: 'Developer'
      display: 'develop'
      slug: 'developer'
    },
    {
      value: 'General & Administrative'
      display: 'administer'
      slug: 'admin'
    },
    {
      value: 'Managing Director'
      display: 'are managing directors'
      slug: 'md'
    },
    {
      value: 'Principal'
      display: 'are principals'
      slug: 'principal'
    },
    {
      value: 'Product Manager'
      display: 'manage products'
      slug: 'product_manager'
    },
    {
      value: 'Support Staff'
      display: 'support'
      slug: 'support'
    }
  ]

  options: (->
    result = []
    result.pushObject App.FilterOption.create
      displayName: 'are'
      slug: 'all_roles'
      isDefault: true
      filterFunc: (record) -> true

    @roles.forEach (role) ->
      result.pushObject App.FilterOption.create
        displayName: role.display
        slug: role.slug
        data: role.value
        filterFunc: (record) ->
          record.get('role') == @get('data')
    result
  ).property('offices')

  fixSelection: ->
    selected = @get('selectedOptions')
    if selected.get('length') == 0
      @reset()
    else if selected.get('length') > 1
      @get('defaultOption').set('selected', false)

  selectedOptionsDidChange: (->
    # if anything other than the default is selected,
    #   deselect the default
    Ember.run.once(this, 'fixSelection')
  ).observes('options.@each.selected')
