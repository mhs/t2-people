<div class="filter-selector">
  <div {{action 'toggleOpen'}}> X </div>
  {{#if isOpen}}
    <ul class="options">
      {{#each thing in options}}
        {{#if thing.selected}}
          <li class="option selected" {{action 'unselect' thing}}>{{thing.displayName}}</li>
        {{else}}
          <li class="option" {{action 'select' thing}}>{{thing.displayName}}</li>
        {{/if}}
      {{/each}}
    </ul>
  {{else}}
  <div {{action 'toggleOpen'}} class="selected-list">
      {{selectedList}}
    </div>
  {{/if}}
</div>
