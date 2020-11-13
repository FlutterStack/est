const dbcon = require('../../config/database');

const Estate = function(estate) {
    this.name = estate.name;
    this.location = estate.location;
    this.description = estate.description;
    this.amount = estate.amount;
}

Estate.getEstateByPropertyId = (propertyId, result) => {
    var sqlSel = "";
    sqlSel = sqlSel + ` SELECT * FROM estate`;
    sqlSel = sqlSel + ` WHERE property_id = "${propertyId}"`;

    console.log("QUERY: " + sqlSel);
    dbcon.query(sqlSel, (err, res) => { 
        if(err) {
            console.log("Unable to found the user");
            result(err, null);
            console.log(err);
            return;
        } else if(res.length) {
            console.log('Estate List:', res);
            result(null, res);
            return;
        }
        result({ data: null }, null);
    });
}

Estate.getInfo = (estateId, result) => {
    var sqlSel = "";
    sqlSel = sqlSel + ` SELECT * FROM lu_estate_info`;
    sqlSel = sqlSel + ` WHERE estate_id = "${estateId}"`;

    console.log("QUERY: " + sqlSel);
    dbcon.query(sqlSel, (err, res) => {
        if(err) {
            console.log("Unable to load information");
            result(err, null);
            return;
        } else if(res.length) {
            console.log('Estate Info', res);
            result(null, res);
            return;
        }
        result({data: null}, null);
    });
}

module.exports = Estate;