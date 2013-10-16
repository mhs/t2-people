var connect = require('connect');

var app = connect();
app.use(connect.static(__dirname));
app.listen(7000);