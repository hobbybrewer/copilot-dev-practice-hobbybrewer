// Import express and cors modules
// create an express app, then add body-parser and cors middlewares using app.use() method

require('./app/config/globalVars');
const { ipLoc } = require('./geolocation/IP2Location');

const express = require('express');
const cors = require('cors');

const initializeApp = () => {
    const app = express();
    const requestIp = require('request-ip');
    app.use(requestIp.mw());

    const db = require("./app/models");
    db.mongoose.connect(db.url, {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }).then(() => {
        console.log("Connected to the database!");
    }).catch(err => {
        console.log("Cannot connect to the database!", err);
        process.exit();
    });


    // Set cors options to http://localhost:8081

    var corsOptions = {
        origin: 'http://localhost:3000'
    };

    // Add cors middleware to express app
    //app.use(cors(corsOptions));
    app.use(cors());

    // parse requests of content-type - application/json
    app.use(express.json());

    // parse requests of content-type - application/x-www-form-urlencoded
    app.use(express.urlencoded({ extended: true }));

    // simple route
    app.get('/', (req, res) => {
        res.json({ message: 'Welcome to the application.' });
        //const ip1 = req.clientIp;
        //ipLoc(ip1);
        //res.end(ip1);
    });

    require("./app/routes/model.routes")(app);
    return app;
}

const app = initializeApp();
module.exports = app;