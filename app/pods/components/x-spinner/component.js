import Ember from 'ember';

export default Ember.Component.extend({
  lines: 12,
  length: 6,
  width: 2,
  radius: 4,
  corners: 1,
  rotate: 0,
  direction: 1,
  color: '#000',
  speed: 1,
  trail: 60,
  shadow: false,
  hwaccel: false,
  className: 'spinner',
  zIndex: 2e9,
  top: 'auto',
  left: 'auto',
  spinner: null,

  showSpinner: function() {
    this.spinner = new Spinner({
      lines:     this.get('lines'),
      length:    this.get('length'),
      width:     this.get('width'),
      radius:    this.get('radius'),
      corners:   this.get('corners'),
      rotate:    this.get('rotate'),
      direction: this.get('direction'),
      color:     this.get('color'),
      speed:     this.get('speed'),
      trail:     this.get('trail'),
      shadow:    this.get('shadow'),
      hwaccel:   this.get('hwaccel'),
      className: this.get('className'),
      zIndex:    this.get('zIndex'),
      top:       this.get('top'),
      left:      this.get('left')
    });

    this.spinner.spin(this.get('element'));
  }.on('didInsertElement'),

  teardown: function() {
    this.spinner.stop();
  }.on('willDestroyElement')
});
