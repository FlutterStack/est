var express = require('express');
require('express-group-routes');
// const user = require('./internal/controller/usercontroller');

const {User, Property} = require('./internal/controller/maincontroller');

const bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true}));

app.group("/api/v1", (router) => {
    router.post('/user/auth', User.userAuth);
    router.get('/properties', Property.loadProperties);
});


var server = app.listen(3000, function(){
    var host = server.address().address;
    var port = server.address().port;
    console.log('REST API app listening at http://%s:%s', host, port)
});