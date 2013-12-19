{{#if hasErrors}}
  <ul class="error-list">
    {{#each error in errors}}
      <li class="error">{{error.message}}</li>
    {{/each}}
  </ul>
{{/if}}
