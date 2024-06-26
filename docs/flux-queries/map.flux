// from(bucket: "demo")
//   |> range(start: 2022-01-01T08:00:00Z, stop: 2022-01-01T20:00:00Z)
//   |> filter(fn: (r) => r["_measurement"] == "home")
//   |> filter(fn: (r) => r["_field"] == "hum")
//   |> map(fn: (r) => ({r with _value: r._value/100.0}))

from (bucket: "demo")
  |> range(start: 2022-01-01T08:00:00Z, stop: 2022-01-01T20:00:00Z)
  |> filter(fn: (r) => r["_measurement"] == "home")
  |> filter(fn: (r) => r["_field"] == "co")
  |> map(fn: (r) => ({r with state: if r._value < 10.0 then "ok" else "warning"}))