# Movie Search App

This is a Flutter application that allows users to search for movies and retrieve detailed information using the [OMDb API](https://www.omdbapi.com/). Users can look up movies using the s query parameter to search for movies by title. 

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
- An API key from [OMDb API](https://www.omdbapi.com/apikey.aspx).

### OMDb API Key Setup

1. Register on [OMDb API](https://www.omdbapi.com/apikey.aspx) to get an API key.
2. In the root directory of your project, create a new `.env` file.
3. Inside `.env`, add the following line, replacing `YOUR_API_KEY` with the key you obtained:
   ```plaintext
   OMDB_API_KEY=YOUR_API_KEY

### Install Dependencies
flutter pub get

### Check Available Devices
flutter devices

### Run the app
flutter run -d device_id

### Potential Enhancements
1. The app could potentially, as an enhancement, give users the option to rate a movie and submit the rating to IMDb.
