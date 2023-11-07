const db = require("../models");
const Model = db.model;
const { ipLoc } = require('../../geolocation/IP2Location');

const getPagination = (page, size) => {
    const limit = size ? +size : global.defaultPageSize;
    const offset = page ? page * limit : 0;

    return { limit, offset };
};


// Find a single Model with an id
exports.findOne = (req, res) => {
    const id = req.params.id;

    Model.findById(id)
        .then(data => {
            if (!data)
                res.status(404).send({ message: "Not found Model with id " + id });
            else res.send(data);
        })
        .catch(err => {
            res
                .status(500)
                .send({ message: "Error retrieving Model with id=" + id });
        });
};

// Update a Model by the id in the request
exports.update = (req, res) => {
    if (!req.body) {
        return res.status(400).send({
            message: "Data to update can not be empty!"
        });
    }

    const id = req.params.id;

    Model.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
        .then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot update Model with id=${id}. Maybe Model was not found!`
                });
            } else res.send({ message: "Model was updated successfully." });
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating Model with id=" + id
            });
        });
};

// Delete a Model with the specified id in the request
exports.delete = (req, res) => {
    const id = req.params.id;

    Model.findByIdAndRemove(id)
        .then(data => {
            if (!data) {
                res.status(404).send({
                    message: `Cannot delete Model with id=${id}. Maybe Model was not found!`
                });
            } else {
                res.send({
                    message: "Model was deleted successfully!"
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Could not delete Model with id=" + id
            });
        });
};

// Retrieve all Models from the database.
exports.findAll = (req, res) => {
    const { page, size, search } = req.query;

    console.log("search:"+search);
    console.log("page:"+page);
    console.log("size:"+size);

    console.log(search);
    var condition = search
        ? { [global.db_search]: { $regex: new RegExp(search), $options: "i" } }
        : {};
    console.log(condition);

    //START:TODO:GeoLogic Geo Location Logic implemented here
    {
        console.log(req.headers["x-forwarded-for"]);
        console.log(req.headers["x-forwarded-for-ip"]);
        const ip1 = req.headers["x-forwarded-for-ip"];

        var geoLocFlag = false;

        console.log(ip1);
        if(ip1 !== undefined && ip1 != "::1" && !ip1.includes("::ffff:") && !ip1.includes("127.0.0.1")){
            const geo = ipLoc(ip1);
            console.log(ip1);
            console.log(geo);
            console.log(Object.keys(condition).length === 0 ? true : false);
            const city = geo.city;
            console.log("city: " + city);
            if (Object.keys(condition).length === 0 && city != "-") {
                condition = { "address.market": { $regex: new RegExp(city), $options: "i" } };
            }
            geoLocFlag = true;
            console.log(condition);
            console.log(geoLocFlag);
        }       
    }
    //END:TODO:GeoLogic Geo Location Logic implemented here

    var options;
    console.log("page:"+page);
    console.log(page=="all");
    if(page=="all" || geoLocFlag){
        options = {
            pagination: false,
        };      
    }
    else
    {
        //const { limit, offset } = getPagination(page, size);
        options = getPagination(page, size);
    }

    console.log("options");
    console.log(options);

    Model.paginate(condition, options)
        .then((data) => {
            console.log(data);
            res.send({
                totalItems: data.totalDocs,
                [global.db_collection]: data.docs,
                totalPages: data.totalPages,
                currentPage: data.page - 1,
            });
        })
        .catch((err) => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving models.",
            });
        });
};
