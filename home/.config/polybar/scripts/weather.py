# https://api.darksky.net/forecast/REDACTED/-19.9351086,-43.9382402,16?units=si&exclude=flags,alerts,daily,hourly,minutely

#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
  api_key = "REDACTED"
  base_url = "https://api.darksky.net"
  endpoint = "/forecast"
  coordinates = ["-19.9351086", "-43.9382402"]

  query_string = {
    "units": "si",
    "exclude": ', '.join(['flags', 'alerts', 'daily', 'hourly', 'minutely'])
  }

  icons = {
    "clear-day": "",
    "partly-cloudy-day": "",
    "clear-night": "",
    "partly-cloudy-night": "",
    "rain": "",
    "snow": "",
    "sleet": "",
    "wind": "",
    "fog": "",
    "cloudy": "",
    "thunderstorm": ""
  }

  try:
      qs = urllib.parse.urlencode(query_string)
      full_url = base_url + endpoint + '/' + api_key + '/' + ', '.join(coordinates) + '?' + qs

      weather = json.loads(urllib.request.urlopen(full_url).read())

      desc = weather['currently']['summary']
      icon = icons.get (weather['currently']['icon'], '')
      temp = int(float(weather['currently']['temperature']))

      icon_label = "%{T5}" + icon + "%{T-}"
      desc_temp_label = "%{T2}" + desc + ", " + '{}'.format(temp) + "°C%{T-}"
      return ' {} {} '.format(icon_label, desc_temp_label)
  except:
      return '  '


if __name__ == "__main__":
	print(main())
