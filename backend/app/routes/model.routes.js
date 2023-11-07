module.exports = app => {
    const model = require("../controllers/model.controller.js");
  
    var router = require("express").Router();
  
    // Retrieve all Listings
    router.get("/", model.findAll);
  
    // Retrieve a single Listing with id
    router.get("/:id", model.findOne);
  
    // Update a Listing with id
    router.put("/:id", model.update);
  
    // Delete a Listing with id
    router.delete("/:id", model.delete);
  
    app.use('/api/model', router);
  };
  