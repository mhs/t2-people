Neons in {{chosem-select value=selectedOffice options=offices}} who work on stuff.

{{#each person in filteredPeople}}
  {{render 'person_card' person}}
{{/each}}
