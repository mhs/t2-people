<div class="container">
  <div class="header">
    <h2>Neons in {{chosem-select class="select-office" value=selectedOffice options=offices}}</h2><h2>who are working on {{chosem-select class="select-project" value=selectedProject defaultProject=anyProject options=projects}}.</h2>
  </div>
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>

