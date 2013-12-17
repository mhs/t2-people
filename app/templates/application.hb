<header>
  <section class="nav-bar">
    <button {{action 'newPerson'}} class="new-person white-button">
      <i>&#10133;</i>Add a Neon
    </button>
    {{view App.NavView}}
  </section>
</header>

<section>
  {{outlet}}
</section>
