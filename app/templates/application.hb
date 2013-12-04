<header>
  <section class="nav-bar">
    {{view App.SelectOffice content=offices
                            optionLabelPath="content.name"
                            optionValuePath="content.id"
                            selection=selectedOffice
                            data-test="offices"
                            class="white-button office-select"}}
    <button {{action 'newPerson'}} class="new-person white-button">
      <i>&#10133;</i>Add a Neon
    </button>
    {{view App.NavView}}
  </section>
</header>

<section>
  {{outlet}}
</section>
