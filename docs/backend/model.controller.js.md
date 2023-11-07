# Model Controller Documentation

This document describes the functions inside the `model.controller.js` file. This file includes functions for various CRUD operations like updating, deleting, finding a specific model, and retrieving all models from the database.

## Dependencies

- _../models_: All the models used in our application are imported from this file.
- _../../geolocation/IP2Location_: For geolocation details, the `ipLoc` function is imported from this file.

## Functions

### Find a single Model with an ID

This function uses the `findById` method from a Model to find an entity with a specific Id. 

```javascript
exports.findOne = (req, res) => {
    const id = req.params.id;
    Model.findById(id)
        .then(data => {
            if (!data) res.status(404).send({ message: "Not found Model with id " + id });
            else res.send(data);
        })
        .catch(err => {
            res.status(500).send({ message: "Error retrieving Model with id=" + id });
        });
};
```

### Update a Model by the ID in the request

This function updates an existing entity by it's Id with the data provided in the body of the request. 

**Important** 💡 - The body of the request must not be empty. Otherwise, a 400 error is returned with the corresponding error message.

```javascript
exports.update = (req, res) => {
    if (!req.body) {
        return res.status(400).send({ message: "Data to update can not be empty!" });
    }
    
    const id = req.params.id;
    Model.findByIdAndUpdate(id, req.body, { useFindAndModify: false })
        .then(data => {
            if (!data) {
                res.status(404).send({ message: `Cannot update Model with id=${id}. Maybe Model was not found!` });
            } else res.send({ message: "Model was updated successfully." });
        })
        .catch(err => {
            res.status(500).send({ message: "Error updating Model with id=" + id });
        });
};
```

### Delete a Model with the specified ID in the request

This function deletes an existing entity by it's ID.

```javascript
exports.delete = (req, res) => {
    const id = req.params.id;
    Model.findByIdAndRemove(id)
        .then(data => {
            if (!data) {
                res.status(404).send({ message: `Cannot delete Model with id=${id}. Maybe Model was not found!` });
            } else {
                res.send({ message: "Model was deleted successfully!" });
            }
        })
        .catch(err => {
            res.status(500).send({ message: "Could not delete Model with id=" + id });
        });
};
```

### Retrieve all Models from the database

This function retrieves all entities from the database. It takes into account pagination, geolocation and search queries. 

- **Pagination**: If `page` query parameter is set, pagination is applied. If it is set to 'all', no pagination is applied.
- **Geolocation**: Obtains the IP address from the client's request and finds the corresponding city. If the search criteria is empty and a city is found, the function retrieves all entities from that city.
- **Search**: If the `search` query parameter is set, the function will return entities that match the regex expression of the search query.

```javascript
exports.findAll = (req, res) => {
    // ... more code
};
```

Functions used:
- **getPagination(page, size)**: This function calculates the limit and offset for MongoDB queries based on the page and size parameters.

## Error Handling

All promise rejections are caught and handeled properly by sending a response with an appropriate HTTP status code and a meaningful error message.