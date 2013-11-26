<header>
  <section class="nav-bar">
    {{view App.SelectOffice content=offices
                            optionLabelPath="content.name"
                            optionValuePath="content.id"
                            selection=selectedOffice
                            data-test="offices"
                            class="white-button office-select"}}
    {{view App.NavView}}
  </section>
</header>

<section>
  {{outlet}}
</section>
