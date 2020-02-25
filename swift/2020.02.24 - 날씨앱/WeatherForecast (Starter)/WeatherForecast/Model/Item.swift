//
//  Item.swift
//  WeatherForecast
//
//  Created by 황정덕 on 2020/02/24.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

let duck = """
{
  "weather": {
    "hourly": [
      {
        "grid": {
          "longitude": "127.0977600000",
          "latitude": "37.1177600000",
          "county": "오산시",
          "village": "청호동",
          "city": "경기"
        },
        "wind": {
          "wdir": "288.00",
          "wspd": "3.50"
        },
        "precipitation": {
          "sinceOntime": "0.00",
          "type": "0"
        },
        "sky": {
          "code": "SKY_O01",
          "name": "맑음"
        },
        "temperature": {
          "tc": "19.20",
          "tmax": "24.00",
          "tmin": "13.00"
        },
        "humidity": "39.00",
        "lightning": "0",
        "timeRelease": "2017-05-25 18:00:00",
        "sunRiseTime": "2017-05-25 05:17:00",
        "sunSetTime": "2017-05-25 19:40:00"
      }
    ]
  },
  "common": {
    "alertYn": "Y",
    "stormYn": "N"
  },
  "result": {
    "code": 9200,
    "requestUrl": "/weather/current/hourly?version=2&lat=37.123&lon=127.123",
    "message": "성공"
  }
}
""".data(using: .utf8)
