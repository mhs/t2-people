<div class="container">
  <div class="filter-people">
    <h2>Neons in {{chosem-select value=selectedOffice options=offices}} who work on stuff.</h2>
  </div>
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>
