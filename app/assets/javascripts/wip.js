document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('submitWeather').onclick=function () {
      var city =document.getElementById('city').value;
        console.log(city);
      if (city != '') {


          var request = new XMLHttpRequest();
          request.open('GET',
              'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&units=metric' + '&APPID=1e3493ba238a8d8b11d3dd295b9a3966',
              true);

          request.onload = function () {
              if (request.status >= 200 && request.status < 400) {
                  // Success!
                  var resp = request.responseText;
                  console.log(resp);
                  var obj = JSON.parse(resp);
                  document.getElementById('show').innerHTML=
                      "<p><b>In "+city+", "+obj.sys.country+": </b></p>" +
                      "<p><strong>Description: </strong>"+ obj.weather[0].main+","+obj.weather[0].description+"</p>"+
                      "<p><strong>Temperature,°C: </strong>"+obj.main.temp+"</p>"+
                      "<p><strong>Humidity,%: </strong>"+obj.main.humidity+"</p>"+
                      "<p><strong>Min.Temp,°C: </strong>"+ obj.main.temp_min+"</p>"+
                      "<p><strong>Max.Temp,°C: </strong>"+ obj.main.temp_max+"</p>"

                  ;

              } else {
                  // We reached our target server, but it returned an error
                  document.getElementById('error').innerHTML='Error returned';
              }
          };

          request.onerror = function () {
              // There was a connection error of some sort
              document.getElementById('error').innerHTML='Connection error';
          };

          request.send();

      }else{
          document.getElementById('error').innerHTML='Field can not be empty';
      }
    }
})