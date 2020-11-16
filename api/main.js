var express = require('express');
require('express-group-routes');

const {User, Property, Estate} = require('./internal/controller/maincontroller');

const bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true}));
var port = Number(process.env.PORT|| 3000);

app.group("/api/v1", (router) => {
    router.post('/user/auth', User.userAuth);
    router.get('/properties', Property.loadProperties);
    router.post('/estates', Estate.getEstateByPropertyId);
    router.post('/estate/info', Estate.getEstateInfo);
    router.post('/user/favorites/save', Estate.addUserFavorites);
    router.post('/user/favorites/all', Estate.getUserFavorites);
    router.post('/user/register', User.registerUser);
    router.post('/user/update', User.updateUser);
});

var server = app.listen(port, function(){
    var host = server.address().address;
    var port = server.address().port;
    console.log('REST API app listening at http://%s:%s', host, port)
});