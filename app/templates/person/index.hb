<div class="header">
  {{name}}
</div>
<div class="profile">
  <div class="person-card">
    <div class="name">{{name}}</div>

    <div class="picture"><img {{ bind-attr src="avatar.small"}}/></div>
    <div class="role">{{role}}</div>
    <div class="office">{{office.name}}</div>
    <div class="start-date">{{start_date}}</div>

    {{#if email}}
      <div class="email"><i>&#9993;</i>{{email}}</div>
    {{/if}}
    {{#if twitter}}
      <div class="twitter"><i class="social">&#62217;</i>{{twitter}}</div>
    {{/if}}
    {{#if github}}
      <div class="github"><i class="social">&#62208;</i>{{github}}</div>
    {{/if}}
  </div>
  <div class="about">
    <header>
      About {{firstName}}
    </header>
    <p class="bio">{{bio}}</p>
  </div>
</div>

