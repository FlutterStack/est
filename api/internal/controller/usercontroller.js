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