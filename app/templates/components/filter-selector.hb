<div class="filter-selector">
  FilterSelector
  <ul class="options">
    {{#each thing in options}}
      {{#if thing.selected}}
        <li class="option selected" {{action 'unselect' thing}}>{{thing.displayName}}</li>
      {{else}}
        <li class="option" {{action 'select' thing}}>{{thing.displayName}}</li>
      {{/if}}
    {{/each}}
  </ul>
</div>
