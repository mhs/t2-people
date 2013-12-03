<div class="header">
  Edit an Employee
</div>

<div class="content">
  <div class="person-card">
    <div class="name">{{input value=name}}</div>
    <div class="picture"><img {{ bind-attr src="avatar.small"}}/></div>
    <div class="picture-upload">{{input type="file" value=formValue}}</div>
    <div class="role">{{role}}</div>
    <div class="office">{{office.name}}</div>
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
