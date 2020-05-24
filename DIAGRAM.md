# Objects & Messages Diagram

Interaction diagram that shows how Objects use Messages to communicate with one another.
```
CLASS          <--       METHOD      --> OUTPUT

Airport        <--   land(a Plane)   --> error (if out of capacity)
Airport        <--   land(a Plane)   --> [a Plane]
Airport        <-- take_off(a Plane) --> [a Plane]
```
Back to [readme](README.md).
