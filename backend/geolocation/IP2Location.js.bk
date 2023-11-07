// Import the IP2Location module
/**
 * IP2Location module for geolocation.
 * @module IP2Location
 * @requires ip2location-nodejs
 * @see {@link https://www.npmjs.com/package/ip2location-nodejs|ip2location-nodejs}
 */

// Import the IP2Location module
const { IP2Location } = require("ip2location-nodejs");

// Create a new IP2Location object
const ip2location = new IP2Location();

// Export a function for IP geolocation
module.exports.ipLoc = function (IP) {
    // Define function-specific variables
    const _func = "ipLoc";
    const debug = true;
    let result, returnObj;

    // Log debug information
    if (debug) {
        console.log(`${_func}: entry`);
    }

    try {
        // Open the IP2Location data file
        ip2location.open("./geolocation/IP2LOCATION-LITE-DB3.BIN");

        // Lookup the geolocation data for the input IP address
        result = ip2location.getAll(IP);

        // Create an object with geolocation data
        returnObj = {};
        returnObj.ip = result.ip;
        returnObj.ipNo = result.ipNo;
        returnObj.country_short = result.countryShort;
        returnObj.countryLong = result.countryLong;
        returnObj.region = result.region;
        returnObj.city = result.city;

        // Close the data file
        ip2location.close();

        // Return the geolocation data object
        return returnObj;
    } catch (err) {
        // Log any errors that occur
        console.log(`${_func}: error -> ${err}`);
    }
};
