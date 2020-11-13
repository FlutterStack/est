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
        if(err) {
            console.log("Unable to found the user");
            result(err, null);
            console.log(err);
            return;
        }
        result({ kind: "not_found" }, null);
    });
}

User.registerUser = (firstName, lastName, email, mobile, password, imgpath, result) => {
    var sqlIns = "";
    sqlIns = sqlIns + " INSERT INTO users SET first_name=?, last_name=?, email=?, mobile_no=?, password=?, img_path=?";

    console.log('QUERY ' + sqlIns);
    dbcon.query(sqlIns, [firstName, lastName, email, mobile, password, imgpath], (err, res) => {
        if(err) {
            console.log("Unable to register user");
            result(err, null);
            console.log(err);
            return;
        } else if(res) {
            console.log('Success insert');
            var statuscode = 0;
            result(null, statuscode.toString());
            return;
        }
        result({data: null}, null);
    });
}

User.updateUserInfo = (firstName, lastName, email, mobile, password, imgpath, userId, result) => {
    var sqlUpd = "";
    sqlUpd = sqlUpd + " UPDATE users SET first_name=?, last_name=?, email=?, mobile_no=?, password=?, img_path=?";
    sqlUpd = sqlUpd + " WHERE idusers=?";

    console.log('QUERY ' + sqlUpd);
    dbcon.query(sqlUpd, [firstName, lastName, email, mobile, password, imgpath, userId], (err, res) => {
        if(err) {
            console.log("Unable to register user");
            result(err, null);
            console.log(err);
            return;
        } else if(res) {
            console.log('Success update');
            var statuscode = 0;
            result(null, statuscode.toString());
            return;
        }
        result({data: null}, null);
    });
}

module.exports = User;