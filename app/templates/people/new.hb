<div class="header">
 Add an Employee
</div>

<div class="errors">
  {{formErrors}}
</div>
<div class="content">
  <div class="person-card">
    <div class="name">
      {{input value=name placeholder="Employee Name"}}
    </div>
    <div class="picture"><img {{ bind-attr src="avatar.small"}}/></div>
    <div class="picture-upload">{{input type="file" value=formValue}}</div>
    <div class="role">{{input placeholder="Employee Role" value=role}}</div>
    <div class="start_date"><label>Start Date:{{input placeholder="dd/mm/yyyy" value=start_date}}</label></div>
    <div class="end_date"><label>End Date:{{input placeholder="dd/mm/yyyy" value=end_date}}</label></div>
    <div class="office">
      {{view Ember.Select
             content=selectableOffices
             selection=office
             optionValuePath="content.id"
             optionLabelPath="content.name"}}
    </div>
    <div class="email"><i>&#9993;</i> {{input value=email}}</div>
    <div class="twitter"><i class="social">&#62217;</i> {{input value=twitter}}</div>
    <div class="github"><i class="social">&#62208;</i> {{input value=github}}</div>

    <div {{action 'save'}} class="confirm pointer"><i></i>
      <i>&#10003;</i>Confirm Edits
    </div>
    <div class="return pointer">
      <i>&#11013;</i>
      {{#link-to 'people'}}Return to List{{/link-to}}
    </div>
  </div>
</div>
