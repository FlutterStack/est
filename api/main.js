var express = require('express');
const user = require('./internal/controller/usercontroller');
const bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true}));

app.post('/user/auth', user.userAuth);

var server = app.listen(3000, function(){
    var host = server.address().address;
    var port = server.address().port;
    console.log('REST API app listening at http://%s:%s', host, port)
});