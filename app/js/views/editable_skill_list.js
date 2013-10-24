define(["application"], function(App) {
  App.EditableSkillList = Ember.View.extend({
    actions: {
      save: function () {
        var person = this.get('controller.person')
          , personData = this.get('controller.personData');

        personData.get('skill_list').addObject(personData.get('newSkill'));

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: {
            person: {skill_list: personData.get('skill_list')}
          }
        }).done(function (data) {
          person.set("skill_list", data.person.skill_list);
          personData.set('newSkill', '');
        });

      },

      destroy: function (skill) {
        var person = this.get('controller.person');

        person.get('skill_list').removeObject(skill);

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: {
            person: {skill_list: person.get('skill_list')}
          }
        }).done(function (data) {
          person.set("skill_list", data.person.skill_list);
        });
      }
    },

    submit: function () {
      this.send('save');
      return false;
    },

    templateName: 'views/editable_skill_list'
  });
});
