var connect = require('connect');

var app = connect();
app.use(connect.static(process.cwd()));
app.listen(process.env.PORT);
