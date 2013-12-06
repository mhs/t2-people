<div class="container">
  <div class="header">
    <h2>Neons in {{chosem-select class="select-office" value=selectedOffice options=offices}} who work on stuff.</h2>
  </div>
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>
