const dbcon = require('../../config/database');

const User = function(user) {
    this.firstname = user.firstname;
    this.lastname = user.lastname;
    this.email = user.email;
}

/****UserByEmail****/
User.findByEmail = (email, password, result) => {
    var sqlSel = "";
    sqlSel = sqlSel + ` SELECT * FROM users`;
    sqlSel = sqlSel + ` WHERE email = "${email}"`;
    sqlSel = sqlSel + ` AND password = "${password}"`

    console.log("QUERY: " + sqlSel);
    dbcon.query(sqlSel, (err, res) => {
      if(res.length) {
            console.log("Found user: ", res[0]);
            result(null, res[0]);
            return;
        } 
        if(res.length) {
            console.log("Unable to found the user");
            result(err, null);
            console.log(err);
            return;
        }
        result({ kind: "not_found" }, null);
    });
}

module.exports = User;