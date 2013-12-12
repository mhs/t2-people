{{#form-for model}}
  {{input name class="edit-name" placeholder="Employee Name"}}
  <div class="picture">
    <img src="http://nicenicejpg.com/350">
    <!-- <img {{ bind-attr src="avatar.small"}}/> -->
  </div>
  {{input avatarFile class="avatar-picker" as="file" label="Choose Avatar"}}
  <div class="edit-role">
    {{input role placeholder="Employee Role"}}
  </div>
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
    {{input start_date placeholder="yyyy-mm-dd" label="Start Date"}}
  </div>
  <div class="end-date">
    {{input end_date placeholder="yyyy-mm-dd" label="End Date" }}
  </div>
  <div class="info">
    {{#input email}}
      {{input-field email}}
      <i>&#9993;{{label-field email text=" "}}</i>
      {{error-field email}}
  </div>
  {{/input}}
  <div class="info">
    {{#input twitter}}
    {{input-field twitter}}
    <i class="social">&#62217;{{label-field twitter text=" "}}</i>
    {{error-field twitter}}
  </div>
  {{/input}}
  <div class="info">
    {{#input github}}
    {{input-field github}}
    <i class="social">&#62208;{{label-field gituhub text=" "}}</i>
    {{error-field github}}
  </div>
  {{/input}}
  <div class="unsellable">
   {{input unsellable as="checkbox" checked="checked"}}
  </div>
  <button {{action 'save'}} class="confirm-button">
    <i>&#10003;</i>
      {{#if isNew}}
        Create Neon
      {{/if}}
      {{#unless isNew}}
        Confirm
      {{/unless}}

  <button class="return-button">
    <i>&#11013;</i>
    {{#link-to 'people'}}Return to List{{/link-to}}
{{/form-for}}

