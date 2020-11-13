const dbcon = require('../../config/database');

const Property = function(property) {
    this.propertyId = property.propertyId;
    this.name = property.name;
    this.description = property.description;
}

Property.getProperties = (result) => {
    var sqlSel = "";
    sqlSel = sqlSel + " SELECT * FROM property";

    dbcon.query(sqlSel, (err, res) => {
        if(err) {
            console.log("Unable to load the residentials");
            result(err, null);
            console.log(err);
            return;
        }
        if(res.length) {
            console.log("Types of land: ", res);
            result(null, res);
            return;
        }

        result({kind: "not_found"}, null);
    });
}

module.exports = Property;