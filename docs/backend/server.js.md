# `server.js` Documentation

The `server.js` file is the main execution point for setting up an Express.js server, connecting it to a database, configuring Cross-Origin Resource Sharing (CORS), parsing JSON and url-encoded requests, defining a simple route, and running the application on a specified port.

## 👀 Overview

- **Express Module**: The application starts by importing the express module and using it to create an express app.
- **CORS Middlewares**: CORS middleware is added to the express app to manage cross-origin requests from specified origins.
- **Body-parser**: Express app uses body-parser middleware to handle incoming requests in a middleware before handlers.
- **Database Connection**: Connects the application to a MongoDB database using mongoose.
- **Routes**: The routes for the application are defined.
- **Server**: Defines the port the server will run on and starts the server.

## 📃 Code Breakdown

```javascript
require('./app/config/globalVars');
const { ipLoc } = require('./geolocation/IP2Location');

const express = require('express');
const cors = require('cors');
const app = express();

const requestIp = require('request-ip');
app.use(requestIp.mw());

const db = require("./app/models");
db.mongoose.connect(db.url, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to the database!");
  })
  .catch(err => {
    console.log("Cannot connect to the database!", err);
    process.exit();
  });

var corsOptions = { origin: 'http://localhost:3000' };

app.use(cors());

app.use(express.json());

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  const ip1 = req.clientIp;
  ipLoc(ip1);
  res.end(ip1);
});

require("./app/routes/model.routes")(app);

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
```

## 🖥️ Sections

### 1. Dependencies and Configuration

```javascript
require('./app/config/globalVars');
const { ipLoc } = require('./geolocation/IP2Location');
const express = require('express');
const cors = require('cors');
const app = express();
const requestIp = require('request-ip');
app.use(requestIp.mw());
```

| Statement | Description |
|-----------|-------------|
| `require('./app/config/globalVars');` | Requires the `globalVars` configuration file. |
| `const { ipLoc } = require('./geolocation/IP2Location');` | Requires the `IP2Location` module and extracts `ipLoc` function from it. |
| `const express = require('express');` | Requires the Express module. |
| `const cors = require('cors');` | Requires the CORS module. |
| `const app = express();` | Initializes an Express application. |
| `const requestIp = require('request-ip');` | Requires the `request-ip` module to get the client's IP address. |
| `app.use(requestIp.mw());` | Uses the middleware from `request-ip` to get the client's IP address. |

### 2. Database Connection

```javascript
const db = require("./app/models");
db.mongoose.connect(db.url, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log("Connected to the database!");
  })
  .catch(err => {
    console.log("Cannot connect to the database!", err);
    process.exit();
  });
```

### 3. CORS Middleware and Body-parser

```javascript
var corsOptions = { origin: 'http://localhost:3000' };

app.use(cors());

app.use(express.json());

app.use(express.urlencoded({ extended: true }));
```
### 4. Routes 

```javascript
app.get('/', (req, res) => {
  const ip1 = req.clientIp;
  ipLoc(ip1);
  res.end(ip1);
});

require("./app/routes/model.routes")(app);
```

### 5. Server

```javascript
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
```