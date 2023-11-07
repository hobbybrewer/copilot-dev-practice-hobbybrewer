// IP2Location - https://www.npmjs.com/package/ip2location-nodejs
// IP2Location Node.js Library - https://ip2location-nodejs.readthedocs.io/en/latest/quickstart.html#query-geolocation-information-from-bin-database
const {IP2Location} = require("ip2location-nodejs");

let ip2location = new IP2Location();

ip2location.open("./IP2LOCATION-LITE-DB3.BIN");

let result = ip2location.getAll("8.8.8.8");

console.log(result);
