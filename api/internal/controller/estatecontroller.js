const Estate = require('../model/estate');

exports.getEstateByPropertyId = (req, res) => {
    var propertyId = req.body.propertyId;
    Estate.getEstateByPropertyId(propertyId, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'Unable to get properties'
                })
            } else {
                res.status(500).send({
                    message: 'Server Error'
                })
            }
        } else {
            res.status(200).json(data);
        }
    });
}

exports.getEstateInfo = (req, res) => {
    var estateId = req.body.estateId;
    Estate.getInfo(estateId, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'Unable to load estate information'
                })
            } else {
                res.status(500).send({
                    message: 'Server Error'
                })
            }
        } else {
            res.status(200).json(data);
        }
    })
}

exports.addUserFavorites = (req, res) => {
    var estateId = req.body.estateId;
    var userId = req.body.userId;
    Estate.addUserFavorites(estateId, userId, (err,data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'Unable to load estate information'
                })
            } else {
                res.status(500).send({
                    message: 'Server Error'
                })
            }
        } else {
            res.status(200).json(data);
        }
    });
}

exports.getUserFavorites = (req, res) => {
    var userId = req.body.userId;
    Estate.getUserFavorites(userId, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'Unable to load estate information'
                })
            } else {
                res.status(500).send({
                    message: 'Server Error'
                })
            }
        } else {
            res.status(200).json(data);
        }
    });
}

exports.addEstate = (req, res) => {
    var name = req.body.name;
    var location = req.body.location;
    var amount = req.body.amount;
    var propertyId = req.body.propertyId;
    var rooms = req.body.rooms;
    var garage = req.body.garage;
    var kitchens = req.body.kitchens;
    var bathrooms = req.body.bathrooms;
    var size = req.body.size;
    var desc = req.body.desc;

    Estate.addEstate(name, location, amount, propertyId, rooms, garage, kitchens, bathrooms, size, desc, (err, data) => {
        if(err) {
            if(err.data == null) {
                res.status(404).send({
                    message: 'Unable to insert estates info'
                })
                return;
            } else {
                res.status(500).send({
                    message: 'Server Error'
                })
                return;
            }
        } else {
            res.status(200).json(data);
            return;
        }
    })
}