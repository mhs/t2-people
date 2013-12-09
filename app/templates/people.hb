<div class="filters">
  Neons in {{chosem-select value=selectedOffice options=offices}} who are working on {{chosem-select value=selectedProject defaultProject=anyProject options=projects}}
</div>
<div class="search">
  {{input search placeholder="Search"}}
</div>

{{#each person in filteredPeople}}
  {{render 'person_card' person}}
{{/each}}
