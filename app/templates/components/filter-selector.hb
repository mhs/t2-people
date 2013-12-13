<div class="filter-selector">
  {{#if isOpen}}
    <div {{action 'toggleOpen'}}>X</div>
    <ul class="options">
      {{#each thing in options}}
        {{#if thing.visible}}
          {{#if thing.selected}}
            <li class="option selected" {{action 'unselect' thing}}>{{thing.displayName}}</li>
          {{else}}
            <li class="option" {{action 'select' thing}}>{{thing.displayName}}</li>
          {{/if}}
        {{/if}}
      {{/each}}
    </ul>
  {{else}}
    <div {{action 'toggleOpen'}} class="selected-list">
      {{selectedList}}
    </div>
  {{/if}}
</div>
