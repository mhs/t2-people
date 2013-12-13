<div class="magnify"><i>&#128269;</i></div>
<div class="search">
  {{input search placeholder="Enter Name"}}
</div>
<div class="person-icon"><i>&#128100;</i></div>
<div class="header">
  <div class="container">
    <h2>
      Neons in
      {{filter-selector modelBinding="officeFilterModel"}}
      who
      {{filter-selector modelBinding="roleFilterModel"}}
      working on
      {{filter-selector modelBinding="projectFilterModel"}}</h2>
  </div>
</div>

<div class="people-container">
  {{#each person in filteredPeople}}
    {{render 'person_card' person}}
  {{/each}}
</div>
