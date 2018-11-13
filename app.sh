#!/usr/bin/env bash
#Author: kovaku
#Description: Command line application to retrieve weather data by city name

#validate commandline argument
if [[ -n "$1" ]]; then
  APPID=$1
else
  echo "Please pass your OpenWeatherMap APPID as command line argument! Exiting..."
  exit
fi

#defining global variables
UNITS=metric
EXIT=false
COUNTRY_CODE=""
CITY=""

function display_commands {
  draw_line 55
  echo "[1]. Retrieve weather data by city name"
  echo "[2]. Retrieve weather data by city name and country"
  echo "[3]. Exit"
  draw_line 55
}

function draw_line {
  LINE_SEPARATOR="-"
  BUFFER=""
  COUNT=${1}
  until [[ ${COUNT} = 0 ]]; do
    BUFFER="$BUFFER$LINE_SEPARATOR"
    COUNT=$(($COUNT - 1))
  done
  echo ${BUFFER}
}

function get_city_name {
  read -p "Please add the city name: " CITY
}

function get_country_code {
  read -p "Please add the country code: " COUNTRY_CODE
}

function call_open_weather_map {
  if [[ -n "$COUNTRY_CODE" ]]; then
    QUERY="$CITY,$COUNTRY_CODE"
  else
    QUERY="$CITY"
  fi
  OPEN_WEATHER_MAP_HOST="http://api.openweathermap.org/data/2.5/weather?q=${QUERY}&units=${UNITS}&APPID=${APPID}"
  RESPONSE=$(curl -G ${OPEN_WEATHER_MAP_HOST})
  draw_line 75
  echo "The current temperature in ${CITY} is $(echo ${RESPONSE} | jq ".main.temp")°C"
  draw_line 75
  echo ""
}

draw_line 75
echo "Welcome in the weather retrieval application! Powered by OpenWeatherMap!"
display_commands

while [[ ${EXIT} = "false" ]]; do
  read -s -p "Please select from the listed actions..."
  echo ""
  case ${REPLY} in
    1) get_city_name
       call_open_weather_map;;
    2) get_city_name
       get_country_code
       call_open_weather_map;;
    3) echo "You selected exit! Bye..."
       EXIT=true;;
    *) echo "Unrecognized command, please select from the available options."
       display_commands;;
  esac
  unset COUNTRY_CODE
done