const express = require("express");
const mysql = require("mysql2/promise");

const app = express();
let db;

const connectToDatabase = async () => {
  db = await mysql.createConnection({
    host: "localhost",
    user: 'root',
    password: 'SWEproject'
  });

  db.connect((err) => {
    if (err) throw err;
    console.info("Connected to Database");
  });
}

const startupServer = () => {
  const startTime = new Date();
  console.info("Starting the server");

  app.get("/", (req, res) => {
    res.json({
      status: "Running",
      startTime: startTime
    });  
  });

  app.get("/stop", (req, res) => {
    res.json({message: "Stopping"});  
    process.exit(0)
  })

  //lists all stops
  //returns an array of objects, each object is the information about a stop, includes all stops in database
  app.get("/listAllStops", async (req, res) => {
    const { query } = req;
    const { table = "shuttlestops", limit = 20, start = 0 } = query;

    const result = await db.query("SELECT * from towsonshuttles." + table + " LIMIT " + start + ", " + limit);

    res.json(result[0]);
  })

  //lists all stops of given route
  //returns an array of objects, each object is the information about a stop, in the order of the route
  //if not given a parameter it defaults to routeID=1 (which is Gold Route)
  app.get("/listFullRoute", async (req, res) => {
    const {query} = req;
    const {table = "paths", limit = 20, start = 0, route = 1} = query;

    const result = await db.query("SELECT * from towsonshuttles.paths WHERE routeID=" + route); //get all stops from paths table
    const pathsArray = result[0]; //get the actual data from query
    if(pathsArray.length === 0) {
      res.json("Information unavailable");
    } else {
      pathsArray.sort((a, b) => a.stoporder - b.stoporder); //sort stops based on the order they occur
      
      let stops = []; //create array for return value

      for(obj of pathsArray) {//for every stop on the route
        const oneStop = await db.query("SELECT * from towsonshuttles.shuttlestops WHERE stopID=" + obj.stopID) //get the stop information
        stops.push(oneStop[0][0]); //put in return array
      }
      res.json(stops);
    }
  })

  //lists all routes in database
  //returns an array of objects, each object is the information about a route
  app.get("/listAllRoutes", async (req, res) => {
    const {query} = req;
    const {table = "shuttleroutes", limit = 20, start = 0} = query;

    const result = await db.query("SELECT * from towsonshuttles." + table + " LIMIT " + start + ", " + limit);

    res.json(result[0]);
  })

  //prints success message or tells user the route is already marked as favorite
  app.get("/addFavorite", async (req, res) => {
    const {query} = req
    const {table = "favorites", route = '?'} = query;

    const result = await db.query("SELECT * FROM towsonshuttles." + table + " WHERE routeID = " + route);
    const routeIsFavorite = result[0];
    if (routeIsFavorite.length === 0) {
      db.query("INSERT INTO towsonshuttles." + table + " (routeID) VALUES (" + route + ")");
      res.json("Route marked as favorite");
    } else {
      res.json("Route already marked as favorite");
    }
  })

  app.get("/removeFavorite", async (req, res) => {
    const {query} = req
    const {table = "favorites", route = '?'} = query;

    await db.query("DELETE FROM towsonshuttles." + table + " WHERE routeID = " + route);
    res.json("Done");
  })

  //returns an array of objects, each object is the information about a route
  app.get("/listFavorites", async (req, res) => {
    const {query} = req
    const {table = "favorites"} = query;
    
    const result = await db.query("SELECT * from towsonshuttles." + table);
    const favoriteRoutes = result[0];
    let returnArray = [];
    for(element of favoriteRoutes) {
      const routeInfo = await db.query("SELECT * from towsonshuttles.shuttleroutes WHERE routeID=" + element.routeID);
      returnArray.push(routeInfo[0][0]);
    }

    res.json(returnArray);
  })


  app.listen(80, () => {
    console.info("Listening on port 80");
  })
}

connectToDatabase();
startupServer();