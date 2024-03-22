from(bucket: "demo")
|> range(start: 2022-01-01T08:00:00Z, stop: 2022-01-01T20:00:00Z)
|> filter(fn: (r) => r._measurement == "home")
|> filter(fn: (r) => r._field == "co" or r._field =="hum" or r._field=="temp")