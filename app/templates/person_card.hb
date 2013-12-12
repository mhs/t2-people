<div class="person-card">
  <div class="name">
    {{name}}
  </div>

  <div class="picture">
    <img {{ bind-attr src="avatar.small"}}/>
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
      Bench
    {{/if}}
  </div>

  {{#if email}}
    <div class="email">
      <i>&#9993;</i>
      <div class="social-info">
      {{email}}
      </div>
    </div>
  {{/if}}

  <div class="twitter">
    <i class="social">&#62217;</i>`
    <div class="social-info">
    @twitterHandle
    </div>
  </div>

  <div class="github">
  <i class="social">&#62208;</i>
    <div class="social-info">
    GithubHandle
    </div>
  </div>

  <div class="profile-options">
    <div class="view-profile">
      {{#link-to 'person' id}}<i>&#128269;</i>
        View Profile
      {{/link-to}}
    </div>

    <div class="edit-profile">
      {{#link-to 'person.edit' id}}<i>&#9881;</i>
        Edit Profile
      {{/link-to}}
    </div>
  </div>
</div>
