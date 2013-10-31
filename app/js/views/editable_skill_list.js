define(["application"], function(App) {
  App.EditableSkillList = Ember.View.extend({

    templateName: 'views/editable_skill_list',

    actions: {
      save: function (skill) {
        var controller = this.get('controller'),
            personData = controller.get('personData');


        personData.get('skill_list').addObject(skill);

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: {
            person: {skill_list: personData.get('skill_list')}
          }
        }).done(function (data) {
          controller.set('person', Ember.Object.create(data.person));
          personData.set('newSkill', '');
        });

      },

      destroy: function (skill) {
        var person = this.get('controller.person'),
            controller = this.get('controller');

        person.get('skill_list').removeObject(skill);

        $.ajax({
          url: App.API_BASE_URL + '/profile',
          type: 'put',
          data: {
            person: {skill_list: person.get('skill_list').toArray()}
          }
        }).done(function (data) {
          controller.set('person', Ember.Object.create(data.person));
        });
      },

      turnOnEditableSkills: function() {
        this.set('editingSkills', true);
        return false;
      },

      turnOffEditableSkills: function() {
        this.set('editingSkills', false);
        return false;
      }
    },

    didInsertElement: function () {
      var controller = this
        , personSkills = this.get('controller.person.skill_list').map(function (item, index) {
            return { text: item, id: item };
          })
        , allSkills = this.get('controller.skills').map(function (item, index) {
            return { text: item.name, id: item.name };
          });

      this.$('#inputSkills')
        .select2({ tags: allSkills })
        .select2('data', personSkills)
        .on('change', function (e) {
          if (e.added)
            controller.send('save', e.added.text);
          else if (e.removed)
            controller.send('destroy', e.removed.text);
          return true;
        });
    },

    submit: function () {
      this.send('save');
      return false;
    },

    onSkillChanged: (function () {
      this.send('save', this.get('newSkillValue'));
    }).observes('newSkillValue')

  });
});
