{{#form-for model}}
  {{input name class="edit-name" placeholder="Employee Name"}}
  <div class="picture">
    <img src="http://nicenicejpg.com/350">
    <!-- <img {{ bind-attr src="avatar.small"}}/> -->
  </div>
  {{input avatarFile class="avatar-picker" as="file" label="Choose Avatar"}}
  {{input role placeholder="Employee Role"}}
  {{#if isNew}}
    <div class="office">
      {{view Ember.Select
             content=selectableOffices
             selection=office
             optionValuePath="content.id"
             optionLabelPath="content.name"}}
    </div>
  {{/if}}
  {{#unless isNew}}
    <div class="office">{{office.name}}</div>
  {{/unless}}
  <div class="start-date">
    {{input start_date placeholder="yyyy-mm-dd" label="Start Date" }}
  </div>
  {{input end_date placeholder="yyyy-mm-dd" label="End Date" }}
  {{#input email}}
    <div class="social-info">
      <i>&#9993;{{label-field email text=" "}}</i>
    </div>
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
    <i>&#10003;</i>
      {{#if isNew}}
        Create Neon
      {{/if}}
      {{#unless isNew}}
        Confirm Edits
      {{/unless}}

  </div>
  <div class="return pointer">
    <i>&#11013;</i>
    {{#link-to 'people'}}Return to List{{/link-to}}
  </div>
{{/form-for}}

