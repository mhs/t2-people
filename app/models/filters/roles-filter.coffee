`import FilterModel from "t2-people/models/filter-model";`
`import FilterOption from "t2-people/components/filter-option";`
RolesFilter = FilterModel.extend

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
    result.pushObject FilterOption.create
      displayName: 'are'
      slug: 'all_roles'
      isDefault: true
      filterFunc: (record) -> true

    @roles.forEach (role) ->
      result.pushObject FilterOption.create
        displayName: role.display
        slug: role.slug
        data: role.value
        filterFunc: (record) ->
          record.get('role') == @get('data')
    result
  ).property('offices')

`export default RolesFilter;`
