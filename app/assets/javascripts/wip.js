document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('submitWeather').onclick=function () {
        var city = document.getElementById('city').value;
        console.log(city);


        if (city != '' && document.getElementById("output").innerHTML == 1 ) {


            var request = new XMLHttpRequest();
            request.open('GET',
                'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric' + '&APPID=4122e656dc75ed86c90dde6ba95fbcd1',
                true);

            request.onload = function () {
                if (request.status >= 200 && request.status < 400) {
                    // Success!
                    var resp = request.responseText;
                    console.log(resp);
                    var obj = JSON.parse(resp);
                    console.log(obj);
                    document.getElementById('show').innerHTML =
                        "<p><b>In " + city + ", " + obj.sys.country + ": </b></p>" +
                        "<p><strong>Description: </strong>" + obj.weather[0].description + "</p>" +
                        "<p><strong>Temperature,°C: </strong>" + obj.main.temp + "</p>" +
                        "<p><strong>Humidity,%: </strong>" + obj.main.humidity + "</p>" +
                        "<p><strong>Min.Temp,°C: </strong>" + obj.main.temp_min + "</p>" +
                        "<p><strong>Max.Temp,°C: </strong>" + obj.main.temp_max + "</p>"

                    ;

                }


                else {
                    // We reached our target server, but it returned an error
                    document.getElementById('error').innerHTML = 'Error returned';
                }
            };

            request.onerror = function () {
                // There was a connection error of some sort
                document.getElementById('error').innerHTML = 'Connection error';
            };

            request.send();

        }

         else if (city != '' && document.getElementById("output").innerHTML == 2) {
            console.log('hello else');

            var request = new XMLHttpRequest();
            console.log(city);
            request.open('GET',
                'http://api.openweathermap.org/data/2.5/forecast/daily?q=' + city +
                '&mode=jsn&APPID=4122e656dc75ed86c90dde6ba95fbcd1&units=metric&cnt=2',true);
              console.log('request true');
            request.onload = function () {
                if (request.status >= 200 && request.status < 400) {
                    console.log('hello 200');
                    // Success!
                    var resp = request.responseText;
                    console.log(resp);
                    var obj = JSON.parse(resp);
                    console.log(obj);

                    document.getElementById('show').innerHTML =
                        "<p><b>In " + city + "," + obj.city.country+ ": </b></p>" +
                        "<p><strong>Description: </strong>"  + obj.list[0].weather[0].description + "</p>" +
                        "<p><strong>Temperature,°C: </strong>" + obj.list[0].temp.day + "</p>" +
                        "<p><strong>Humidity,%: </strong>" + obj.list[0].humidity + "</p>" +
                        "<p><strong>Min.Temp,°C: </strong>" + obj.list[0].temp.min + "</p>" +
                        "<p><strong>Max.Temp,°C: </strong>" + obj.list[0].temp.max + "</p>"

                } else {
                    // We reached our target server, but it returned an error
                    document.getElementById('error').innerHTML = 'Error returned';
                }
            };
            request.onerror = function () {
                // There was a connection error of some sort
                document.getElementById('error').innerHTML = 'Connection error';
            };

            request.send();


        }
        else {
            document.getElementById('error').innerHTML = 'Field can not be empty';
        }
    }
})

window.addEventListener("load", function(){
    var slider = document.getElementById("slider");
    slider.addEventListener("change", function(){
        document.getElementById("output").innerHTML = this.value;
    });
});
