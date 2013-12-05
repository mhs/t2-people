<div class="person-card">
  <div class="name">{{name}}</div>

  <div class="picture"><img {{ bind-attr src="avatar.small"}}/></div>
  <div class="role">{{role}}</div>
  <div class="office">{{office.name}}</div>

  {{#if email}}
    <div class="email"><i>&#9993;</i>{{email}}</div>
  {{/if}}
  {{#if twitter}}
    <div class="twitter"><i class="social">&#62217;</i>{{twitter}}</div>
  {{/if}}
  {{#if github}}
    <div class="github"><i class="social">&#62208;</i>{{github}}</div>
  {{/if}}
  <div class="current-allocation">
    {{currentAllocation.project.name}}
  </div>

  <div class="view-profile">{{#link-to 'person' id}}<i>&#128269;</i>View Profile{{/link-to}}</div>
  <div class="edit-profile">{{#link-to 'person.edit' id}}<i>&#9881;</i>Edit Profile{{/link-to}}</div>
</div>
