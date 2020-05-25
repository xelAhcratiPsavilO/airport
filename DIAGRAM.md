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
Airport         <-- take_off(a Plane) --> a Plane
Airport         <--      capacity     --> given capacity (if given)
Airport         <--      capacity     --> default capacity

WeatherForecast <--      stormy?      --> true (25% of times)
WeatherForecast <--      stormy?      --> false (75% of times)

Plane           <--  land(an Airport) --> error (unless flying)
Plane           <--  land(an Airport) --> an Airport
Plane           <--      take_off     --> error (if flying)
Plane           <--      take_off     --> true
Plane           <--      airport      --> error (if flying)
Plane           <--      airport      --> an Airport
```
Back to [readme](README.md).
