
#Toilet Pal

See the app in action at http://toilet-pal.herokuapp.com/

Lookie Loo is a Ruby on Rails web application that maps public toilets in NYC.

## Features

### Public Toilet Mapping
Lookie Loo uses data from the NYC Open Data Project and the Google Maps API to allow users to search for public restrooms near them, "favorite" restrooms, and leave reviews. The application checks the current location of the user and if available, centers the map and restroom suggestions around that location. If user location is unclear, the application automatically shows public restrooms within a mile of central manhattan.

#### Reviews
Logged in users can leave written reviews about restrooms they have visited. They can also rank the restroom on a scale of 1-5 stars. Users who are not logged in can read reviews but not post.

### Restroom Profiles
Users can view profiles of every restroom. These profiles include the name of the restroom, the address (usually cross streets), the neighborhood, a close-up map view, and all reviews that have been left by users.

### Favorites
Logged in users can "favorite" specific restrooms. These "favorited" restrooms are listed in the user's profile page, along with a list of the reviews they have left.

### Admin Portal
Admin users can review a list of all users and delete them as necessary.

## Special Features

### OmniAuth
User login is currently handled via bCrypt, but we are working on implementing Facebook and Twitter login.

#### Search
From the homepage, users can input a search query that updates the map they are looking at.

## Work in Progress / To Do

- [ ] Facebook and Twitter Login
- [ ] Allow users to filter restrooms by tag
- [ ] Switch from bCrypt to devise for user handling
- [ ] Get directions from current location to public restroom via Google Maps
- [ ] Allow users to upload information about restrooms not already in database
- [ ] Allow users to upload photos of restrooms, with admin review before posting
- [ ] Public restroom information from other parts of the country
- [ ] User avatars
- [ ] Social Media sharing
- [ ] Optimize views for mobile viewing



