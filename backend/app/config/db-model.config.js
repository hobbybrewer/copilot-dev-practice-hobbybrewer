/**
 * This module exports an object with a MongoDB connection string.
 * The connection string is constructed using global variables for the hostname, port, and database name.
 * 
 * @module db-model.config
 * @property {string} url - The MongoDB connection string.
 */
module.exports = {
    url: `mongodb://${global.db_hostname}:${global.db_port}/${global.db_database}`
}