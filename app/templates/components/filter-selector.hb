<div class="filter-selector">
  {{#if isOpen}}
    <div {{action 'toggleOpen'}}>{{selectedList}}</div>
    <ul class="options">
    <div class="filter-options">
      <div class="reset" {{action 'reset'}}>
        <p>Reset Filter</p>
        <span>&#10226;</span>
      </div>
      <div class="confirm-choice" {{action 'toggleOpen'}}>
        <span>&#10003;</span>
        <p>Confirm Choice</p>
      </div>
    </div>
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
