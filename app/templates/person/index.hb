<div class="profile-container">
  <div class="profile">
    <div class="header">
      <h2>{{name}}</h2>
    </div>
    <div class="person-card">
      <div class="picture"><img {{ bind-attr src="avatar.small"}}/></div>
      <div class="role">{{role}}</div>
      <div class="office">{{office.name}}</div>
      <div class="start-date">
        Start Date{{start_date}}
      </div>

      {{#if email}}
      <div class="info">
        <div class="email"><i>&#9993;</i>
          {{email}}
        </div>
      </div>
      {{/if}}

      {{#if twitter}}
      <div class="info">
        <div class="twitter"><i class="social">&#62217;</i>
          {{twitter}}
        </div>
      </div>
      {{/if}}

      {{#if github}}
      <div class="info">
        <div class="github"><i class="social">&#62208;</i>
          {{github}}
        </div>
      </div>
      {{/if}}
    </div>

    <div class="about">
      <div class="profile-name">
        About {{firstName}}
      </div>
      <div class="current-allocation">
        {{currentAllocation.project.name}}
      </div>
      <div class="bio">
        <p>{{bio}}</p>
      </div>
    </div>
  </div>
</div>
