<div class="person-card">
  <div class="name">
    {{#link-to 'person' id}}
      {{name}}
    {{/link-to}}
  </div>

  <div class="picture">
    {{#link-to 'person' id}}
      <img {{ bind-attr src="avatar.small"}}/>
    {{/link-to}}
  </div>

  <div class="role">
    {{role}}
  </div>

  <div class="office">
    {{office.name}}
  </div>

  <div class="project">
    Assigned To
  </div>

  <div class="current-project">
    {{#if currentAllocation.project.name}}
      {{currentAllocation.project.name}}
    {{else}}
      {{#if unsellable}}
        Overhead
      {{else}}
        Bench
      {{/if}}
    {{/if}}
  </div>

  <div class="social-info">
    {{#if email}}
      <div class="email">
        <a {{bind-attr href="mailTo"}}>
          <i>&#9993;</i>
        </a>
      </div>
      {{else}}
      <div class="email">
        <i class="placeholder">&#9993;</i>
      </div>
    {{/if}}

    {{#if twitter}}
      <div class="twitter">
        <a {{bind-attr href="twitterURL"}}  target="_blank">
          <i class="social">&#62217;</i>
        </a>
      </div>
    {{else}}
      <div class="twitter">
        <i class="placeholder social">&#62217;</i>
      </div>
    {{/if}}

    {{#if github}}
      <div class="github">
        <a {{bind-attr href="githubURL"}} target="_blank">
          <i class="social">&#62208;</i>
        </a>
      </div>
      {{else}}
      <div class="github">
        <i class="placeholder social">&#62208;</i>
      </div>
    {{/if}}
  </div>

  <div class="edit-profile">
    {{#link-to 'person.edit' id}}<i>&#9881;</i>
      Edit Profile
    {{/link-to}}
  </div>
</div>
