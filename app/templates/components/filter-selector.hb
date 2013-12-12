<div class="filter-selector">
  FilterSelector
  <ul class="options">
    {{#each thing in options}}
      <li {{action 'select' thing.slug}} {{bind-attr class=":option thing.selected"}}>{{thing.displayName}}</li>
    {{/each}}
  </ul>
</div>
