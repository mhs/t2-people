<div class="magnify"><i>&#128269;</i></div>
<div class="search">
  {{input search placeholder="Enter Name"}}
</div>
<div class="person-icon"><i>&#128100;</i></div>
<div class="header">
  <div class="container">
    <div class="filter">
      <h2>Neons in {{view Ember.Select class="select-office" content=offices value=selectedOffice optionLabelPath="content.name"}}</h2><h2>who are working on {{view Ember.Select  class="select-project" content=projects value=selectedProject optionLabelPath="content.name"}}.</h2>
    </div>
  </div>
</div>

<div class="people-container">
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>
