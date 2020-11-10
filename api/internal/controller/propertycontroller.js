const Property = require('../model/property');

exports.loadProperties = (req, res) => {
    Property.getProperties((err, data) => {
        if(err) {
            if(err.kind === "not_found") {
                res.status(404).send({
                    message: 'Unable to get properties'
                })
            }  else {
                res.status(500).send({
                  message: "Error 505"
                });
            }
        } else {
            res.status(200).json(data);
        }
    });
}