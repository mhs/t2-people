<div class="container">
  <div class="header">
    <h2>Neons in {{chosem-select class="select-office" value=selectedOffice options=offices}}</h2><h2>who are working on {{chosem-select class="select-project" value=selectedProject defaultProject=anyProject options=projects}}.</h2>
  </div>
  <div class="search">
    {{input search placeholder="Search"}}
  </div>
  <div class="people-container">
    {{#each person in filteredPeople}}
      {{render 'person_card' person}}
    {{/each}}
  </div>
</div>
