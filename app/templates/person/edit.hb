<div class="header">
  Edit an Employee
</div>

<div class="content">
  <div class="person-card">
    {{#form-for model}}
      {{input name placeholder="Employee Name"}}
      {{input avatarFile as="file" label="Avatar"}}
      {{input role placeholder="Employee Role"}}
      {{input start_date placeholder="dd/mm/yyyy" label="Start Date" }}
      {{input end_date placeholder="dd/mm/yyyy" label="End Date" }}
      <div class="office">{{office.name}}</div>
      {{#input email}}
        <i>&#9993;{{label-field email text=" "}}</i>
        {{input-field email}}
        {{error-field email}}
      {{/input}}
      {{#input twitter}}
        <i class="social">&#62217;{{label-field twitter text=" "}}</i>
        {{input-field twitter}}
        {{error-field twitter}}
      {{/input}}
      {{#input github}}
        <i class="social">&#62208;{{label-field gituhub text=" "}}</i>
        {{input-field github}}
        {{error-field github}}
      {{/input}}
      {{input unsellable as="checkbox"}}
      <div {{action 'save'}} class="confirm pointer"><i></i>
        <i>&#10003;</i>Confirm Edits
      </div>
      <div class="return pointer">
        <i>&#11013;</i>
        {{#link-to 'people'}}Return to List{{/link-to}}
      </div>
    {{/form-for}}
  </div>
</div>
