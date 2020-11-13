const User = require('../model/user');


/****userAuth****/
exports.userAuth = (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    User.findByEmail(email, password, (err, data) => {
        if(err) {
            if(err.kind === "not_found") {
                res.status(404).send({
                    message: 'User not exists.....'
                })
            }  else {
                res.status(500).send({
                  message: "Error retrieving Customer with id " + email
                });
            }
        } else {
            res.status(200).json(data);
        }
    });
}

exports.registerUser = (req, res) => {
    var firstname = req.body.firstname;
    var lastname = req.body.lastname;
    var email = req.body.email;
    var mobile = req.body.mobile;
    var password = req.body.password;
    var imgpath = req.body.imgpath;
    User.registerUser(firstname, lastname, email, mobile, password, imgpath, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'User not exists.....'
                })
            } else {
                res.status(500).send({
                  message: "Server Error"
                });
            }
        } else {
            res.status(200).json(data);
        }
    });
}

exports.updateUser = (req, res) => {
    var userId = req.body.userId;
    var firstname = req.body.firstname;
    var lastname = req.body.lastname;
    var email = req.body.email;
    var mobile = req.body.mobile;
    var password = req.body.password;
    var imgpath = req.body.imgpath;
    User.updateUserInfo(firstname, lastname, email, mobile, password, imgpath, userId, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'User not exists.....'
                })
            } else {
                res.status(500).send({
                  message: "Server Error"
                });
            }
        } else {
            res.status(200).json(data);
        }
    });
}