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
        <i class="email-icon">&#9993;</i>
        <div class="email">
          {{email}}
        </div>
      </div>
      {{/if}}

      <div class="info">
        <i class="social">&#62217;</i>
        <div class="twitter">
          @twitterhandle
        </div>
      </div>

      {{#if twitter}}
      <div class="info">
        <i class="social">&#62217;</i>
        <div class="twitter">
          {{twitter}}
        </div>
      </div>
      {{/if}}

      <div class="info">
        <i class="social">&#62208;</i>
        <div class="github">
          GithubHandle
        </div>
      </div>

      {{#if github}}
      <div class="info">
        <i class="social">&#62208;</i>
        <div class="github">
          {{github}}
        </div>
      </div>
      {{/if}}

      <button class="return-button">
      <i>&#11013;</i>
      {{#link-to 'people'}}Return to List{{/link-to}}
    </div>

    <div class="about">
      <div class="profile-name">
        About {{firstName}}
      </div>
      <div class="bio">
        <p>{{bio}}</p>
      </div>
      <div class="profile-project">
        Current Project
      </div>
      <div class="current-allocation">
        <p>{{currentAllocation.project.name}}</p>
      </div>
    </div>
  </div>
</div>
