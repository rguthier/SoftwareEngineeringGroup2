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

  app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'); // If needed
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type'); // If needed
    res.setHeader('Access-Control-Allow-Credentials', true); // If needed
    next();
  });

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

    const result = await db.query("SELECT * from towsonshuttles." + table + " WHERE routeID=" + route); //get all stops from paths table
    const pathsArray = result[0]; //get the actual data from query
    if(pathsArray.length === 0) {
      res.json("Information unavailable");
    } else {
      let stops = []; //create array for return value (list of stops/their information)

      //get the frequency of arrivals (use to find next arrival time)
      const getFrequency = await db.query("SELECT frequency from towsonshuttles.shuttleroutes WHERE routeID=" + route);
      const frequency = getFrequency[0][0].frequency;

      const currentDate = new Date(); //used to calculate next arrival time at each stop

      for(obj of pathsArray) {//for every stop on the route
        //find the next arrival time (increment time until you go past the current time, then return the previous one)
        //if you get to the last time, just return the first one
        let firstArray = obj.firstTime.split(":");
        let lastArray = obj.lastTime.split(":");

        let compare = new Date(); //this will be used to find the right time (compare to current)
        compare.setHours(firstArray[0]);
        compare.setMinutes(firstArray[1]);

        let lastTime = new Date(); //used to check that we haven't gone out of routes time range
        lastTime.setHours(lastArray[0]);
        lastTime.setMinutes(lastArray[1]);

        let nextTime = new Date(); //will store the right time when it's found
        nextTime.setHours(firstArray[0]);
        nextTime.setMinutes(firstArray[1]);

        while (compare.getTime() !== lastTime.getTime()) {//loop while compare is before last time (so every time is checked)
          compare.setMinutes(compare.getMinutes()+frequency);
          if(compare.getDate() != currentDate.getDate()) {
            compare.setDate(currentDate.getDate());
          }
          let difference = compare - currentDate;
          if((difference >= 0 && (difference < (nextTime - currentDate) || (nextTime - currentDate < 0)))) {//if the new time is closer than the current value of nextTime, update nextTime
            nextTime.setHours(compare.getHours());
            nextTime.setMinutes(compare.getMinutes());
          }
        }
        nextTime.setSeconds(0); //regardless the time, seconds should be 0

        const oneStop = await db.query("SELECT * from towsonshuttles.shuttlestops WHERE stopID=" + obj.stopID) //get the stop information
        stops.push(oneStop[0][0]); //put in return array
        stops[stops.length-1].nextArrival = nextTime.toLocaleTimeString(); //add nextTime to array
      }
      stops.sort((a, b) => a.nextArrival.localeCompare(b.nextArrival));

      res.json(stops);
    }
  })

  app.get("/getRouteInfo", async (req, res) => {
    const {query} = req;
    const {table = "shuttleroutes", routeName = '?'} = query;

    const result = await db.query("SELECT * from towsonshuttles." + table + " WHERE routeName='" + routeName +"'");
    res.json(result[0]);
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