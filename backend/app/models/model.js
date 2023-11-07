let schemaJson = require(`./schemas/${global.dataModel}-schema.json`);

module.exports = (mongoose, mongoosePaginate) => {
    var schema = mongoose.Schema(
        schemaJson.listingsAndReviews,
        { timestamps: true }
    );

    
    schema.method("toJSON", function () {
        const { __v, _id, ...object } = this.toObject();
        object.id = _id;
        return object;
    });
    

    schema.plugin(mongoosePaginate);

    const Model = mongoose.model(global.db_collection, schema,global.db_collection);
    return Model;
};