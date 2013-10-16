var connect = require('connect');

var app = connect();
app.use(connect.static(__dirname));g
app.listen(process.env.PORT);