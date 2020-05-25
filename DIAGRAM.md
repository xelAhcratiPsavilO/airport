# Objects & Messages Diagram

Interaction diagram that shows how Objects use Messages to communicate with one another.
```
CLASS           <--       METHOD      --> OUTPUT

Airport         <--   land(a Plane)   --> error (if stormy)
Airport         <--   land(a Plane)   --> error (if out of capacity)
Airport         <--   land(a Plane)   --> [a Plane]
Airport         <-- take_off(a Plane) --> error (if stormy)
Airport         <-- take_off(a Plane) --> error (if Plane not at airport)
Airport         <-- take_off(a Plane) --> confirmation of departure
Airport         <--      capacity     --> given capacity (if given)
Airport         <--      capacity     --> default capacity

WeatherForecast <--      stormy?      --> true (25% of times)
WeatherForecast <--      stormy?      --> false (75% of times)

Plane           <--      take_off     --> error (if flying)
Plane           <--      airport      --> error (if flying)
```
Back to [readme](README.md).
