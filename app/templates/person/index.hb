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
        <p>I see a beautiful city and the brilliant people rising from this abyss. I see the lives, for which I lay down my life. Peaceful, useful, prosperous and happy. I see that I hold a sanctuary in their hearts and in the hearts of their descendents. Generations ends. That is the far, far better thing that I do than I have ever done. That is a far, far better rest that I go to than I have ever known.</p>

        <p>Every man who has lotted here over the centuries, has looked up to the light and imagined climbing to freedom. So easy, so simple! And like shipwrecked men turning to seawater foregoing uncontrollable thirst, many have died trying. And then here there can be no true despair without hope. So as I terrorize Gotham, I will feed its people hope to poison their souls. I will let them believe that they can survive so that you can watch them climbing over each other to stay in the sun. You can watch me torture an entire city. And then when you've truly understood the depth of your failure, we will fulfill Ra's Al Ghul's destiny. We will destroy Gotham. And then, when that is done, and Gotham is... ashes Then you have my permission to die.</p>
        <div class="profile-project">
          Current Project
        </div>
        <div class="current-allocation">
          <p>{{currentAllocation.project.name}}</p>
      </div>
      </div>
    </div>
  </div>
</div>
