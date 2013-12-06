<div class="container">
  <div class="header">
    <h2>Neons in {{chosem-select value=selectedOffice options=offices}} who are working on {{chosem-select value=selectedProject defaultProject=anyProject options=projects}}.</h2>
  </div>
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>

