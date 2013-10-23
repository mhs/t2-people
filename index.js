var connect = require('connect');

var app = connect();
app.use(connect.logger('dev'));
app.use(connect.static(__dirname));
app.listen(process.env.PORT);
