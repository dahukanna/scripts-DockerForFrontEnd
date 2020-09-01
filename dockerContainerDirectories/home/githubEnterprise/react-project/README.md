# Reactjs Project
## Get Started
1. `cd` into the app directory
2. Install/ensure you're running the right version of Node/npm. 
   - Recommend install [node version manager](https://github.com/creationix/nvm) and run `nvm use`
3. Run `npm install` to install dependencies
4. Run `npm start` to start the app
5. Access the running app in browser at [https://localhost:<insert port number>/](https://localhost:<insert port number>/)

## Folders
* `.gitignore` - Git uses it to determine which files and directories to ignore, before you make a commit.
* `config` - Config files for server - including authentication
* `lib` - Node server files
* `src` - Resources to be compiled and served to the user
  * `components` - JavaScript components used to build screens
  * `containers` - Highest Level JavaScript Components (screens)
  * `media` - Various static media files
    * `audio` - audio files
    * `images` - image files
    * `video` - video files
  * `mock-data` - Sample data files consumed by the app (API placeholders)
  * `styles` - SASS files
  * `index.js` - Entry point for the application
  * `index.html` - Base html file for the application