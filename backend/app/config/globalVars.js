global.db_hostname = "localhost";
global.db_port = "27017";
global.debug = true;

//airbnb
global.dataModel = "airbnb";
//global.dataModel = "companies";
//global.dataModel = "movies";
//global.dataModel = "restaurants";

global.dbCollectionMap = {
    airbnb: {
        db_database:"sample_airbnb",
        db_collection:"listingsAndReviews",
        search: "name"
    },
    companies: {
        db_database:"sample_training",
        db_collection:"companies",
        search: "name"
    },
    movies: {
        db_database:"sample_mflix",
        db_collection:"movies",
        search: "title"
    },
    restaurants: {
        db_database:"sample_restaurants",
        db_collection:"restaurants",
        search: "name"
    },
}
global.db_database = global.dbCollectionMap[global.dataModel].db_database;
global.db_collection = global.dbCollectionMap[global.dataModel].db_collection;
global.db_search = global.dbCollectionMap[global.dataModel].search;

console.log(db_database);
console.log(db_collection);

//airbnb
//global.dataModel = "airbnb";
//global.db_database = "sample_airbnb";
//global.db_collection = "listingsAndReviews";

global.defaultPageSize = 5;