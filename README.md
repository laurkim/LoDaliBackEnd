This is a Ruby on Rails API back end for Sonder, an application that authorizes a user through their existing Spotify account and compiles a personality analysis based on the user's listening habits. The front end code, build in React and Redux, as well as a link to the working demo can be found at [this](https://github.com/laurkim/SonderFrontEnd) repository.

The database is built on PostgreSQL. The domain for this application is comprised of Login (for authorization and authentication through Spotify OAuth2), Users, Track Features, Top Tracks, Top Artists, and Personality Insights.

This application relies on OAuth2 with a user's real existing Spotify account. After being authenticated and authorized, the user's listening history is traversed and analyzed to obtain their top played tracks. Based on these tracks, a new playlist will be created for said user compiled with recommended tracks.

The user's interactions with the React/Redux front end application will trigger specific controller actions, depending on the HTTP verb including in the API calls from the client-side.

Active Model Serializers have been implemented to limit the data included in the response to the Javascript front end.
