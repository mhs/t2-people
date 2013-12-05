Neons in {{chosem-select value=selectedOffice options=offices}} who are working on {{chosem-select value=selectedProject options=projects}}

{{#each person in filteredPeople}}
  {{render 'person_card' person}}
{{/each}}
