window.onload = () => {
    console.info ("I've loaded");
    
    const loadStops = (response) => {
        let results = "Next arrival times:";
        if(response === "Information unavailable") {
            results += " " + response;
            //$('#results-list').html(response);
        } else {
            for (const val of response) {
                results += "<li>" + val.stopID + ": " + val.stopName + ", " + val.nextArrival + "</li>";
            }
        }
        $('#results-list').html(results);
        addFavoriteButton("Favorite", 'results-list');
        addUnfavoriteButton("Un-favorite", 'results-list');

        updateFavoriteListeners();
        updateUnfavoriteListeners();
  
        console.info("Got some data");
    };

    const loadRouteInfo = (response) => {
        result =  response[0].daysRunning + ", " + response[0].timeRange;
        document.getElementById('route-time-info').innerHTML = result;
    }
  
    const loadRoutes = (response) => {
        $("#route-selector").html("");
        let newButton = "";
        for(const val of response) {
            newButton = val.routeName;
            addRouteButton(newButton, 'route-selector');
        }
        
        updateRouteListeners();
    };

    const addOrRemoveFavorite = (response) => {
        alert(response);
    }
  
    const addRouteButton = (name, location) => {
        let results = "<button class=\"btn btn-outline-primary route-button\" type=\"button\">" + name + "</button>";
        document.getElementById(location).innerHTML += results;
    }
  
    const addFavoriteButton = (name, location) => {
        let results = "<button class=\"btn btn-outline-primary favorite-button\" type=\"button\">" + name + "</button>";
        document.getElementById(location).innerHTML += results;
    }

    const addUnfavoriteButton = (name, location) => {
        let results = "<button class=\"btn btn-outline-primary unfavorite-button\" type=\"button\">" + name + "</button>";
        document.getElementById(location).innerHTML += results;
    }
  
    const updateRouteListeners = () => {
      $(".route-button").off();
      
      $(".route-button").on("click", (evt) => {
        const name = evt.currentTarget.textContent;
        console.info("Clicked on a route: " + name);
  
        const names = ["Gold Route", "Gold Route Weekend", "Stadium - Core Campus", "West Village - Core Campus", "Goucher - Loch Raven", "Kenilworth - Armory", "Lake - Walker"];
        const idx = names.indexOf(name);
  
        document.getElementById('route-heading').innerHTML = name;

        $.ajax({
            type: "GET",
            url: "http://localhost/getRouteInfo?routeName=" + (name),
            success: loadRouteInfo
        })
  
        $.ajax({
            type: "GET",
            url: "http://localhost/listFullRoute?route=" + (idx+1),
            success: loadStops
        });
      });
    }

    const updateFavoriteListeners = () => {
        $(".favorite-button").off();
        
        $(".favorite-button").on("click", (evt) => {
            const routeName = document.getElementById('route-heading').textContent;
            console.log(routeName);
            console.log("button clicked");
            const names = ["Gold Route", "Gold Route Weekend", "Stadium - Core Campus", "West Village - Core Campus", "Goucher - Loch Raven", "Kenilworth - Armory", "Lake - Walker"];
            const idx = names.indexOf(routeName);

            $.ajax({
                type: "GET",
                url: "http://localhost/addFavorite?route=" + (idx+1),
                success: addOrRemoveFavorite
            });
        });
    }

    const updateUnfavoriteListeners = () => {
        $(".unfavorite-button").off();
        
        $(".unfavorite-button").on("click", (evt) => {
            const routeName = document.getElementById('route-heading').textContent;
            console.log(routeName);
            console.log("button clicked");
            const names = ["Gold Route", "Gold Route Weekend", "Stadium - Core Campus", "West Village - Core Campus", "Goucher - Loch Raven", "Kenilworth - Armory", "Lake - Walker"];
            const idx = names.indexOf(routeName);

            $.ajax({
                type: "GET",
                url: "http://localhost/removeFavorite?route=" + (idx+1),
                success: addOrRemoveFavorite
            });
        });
    }
  
  updateRouteListeners();
  updateFavoriteListeners();
  updateUnfavoriteListeners();
  
    $(".navButton").on("click", (evt) => {
        $(".active").removeClass("active");
        $(evt.currentTarget).addClass("active");
        console.log("Nav buttons changed");
    });
  
    $(".favoritesListButton").on("click", (evt) => {
        $.ajax({
            type: "GET",
            url: "http://localhost/listFavorites",
            success: loadRoutes
          });
    });
  
    $(".allRoutesButton").on("click", (evt) => {
        $.ajax({
            type: "GET",
            url: "http://localhost/listAllRoutes",
            success: loadRoutes
        });
    });

}