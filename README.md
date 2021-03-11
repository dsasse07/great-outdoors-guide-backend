<h1 style="text-align: center"> Great Outdoors Guide </h1>
<p align="center">
<img 
  src="./public/GOG Logo 2.png"
  alt="Fludoku Animation" 
>
</p>
<h2 style="text-align: center"> Back End </h2>

--- 

Welcome to the great outdoors. Plan your next great adventure to the U.S. National Parks throug the integrated National Parks Service database and interactive maps. Here you will find information and links for each of the national parks.

Create an account on the website to help track your progress as you begin (or continue) your journey to visit them all. Log a visit at a park by completing a journal entry to document you trip, upload photos of your favorite moments, and leave a review for other users for each of the parks.

#### About

Great Outdoors Guide was completed as a phase 4 project at Flatiron School by Daniel Sasse and John Wisneski. This app is designed with React Functional Components and Hooks, and integrates Google Maps React, Material-ui for icons, and custom styled components for styling. This Rails back end supports the corresponding React Frontend. The API stores photos from user uploads to Cloudinary via ActiveStorage. The repo link for the frontend can be found [here]("https://github.com/dsasse07/great-outdoors-guide-frontend"). 

#### Usage

To run locally :
* run `bundle install` to install dependencies
* run `rails db:create` to create a PostgreSQL database.
  * PostgreSQL is required
* run `rails db:migrate` to build the db schema
* run `rails db:seed` to initialize the test user

* Store the necessary environment variables into your `.env` file and ensure it is included in your `.gitignore.`
  * Required variables:
    * JWT Secret to use for user authentication.
      * generate secret using `rake secret`
      * storace the secret as `JWT_SECRET = **********` 
    * Cloudinary Account Info. Make an account [here]("https://cloudinary.com/").
      ```
      CLOUDINARY_URL=cloudinary:// *******************************
      CLOUD_NAME=************
      CLOUD_KEY= ************
      CLOUD_SECRET=****************
      ```
#### API End points
  * `POST /login`
    * Access point to log a user in with credentials. Return user instance and their associated visits as JSON.
  * `POST /signup`
    * Creates a new user instance. Returns created user instance and visits as JSON
  * `GET /me`
    * auto-login endpoint to find a user by their stored JWT_TOKEN. If successful, user instance and visits returned as JSON.
    * Requires Header: `Authorization: "Bearer *token* `
  * `PATCH /users/:id` 
    * update users first name, last name, password, or delete a trip. Returns updated user instance and visits as JSON
    * Requires Header: `Authorization: "Bearer *token* `
  * `DELETE images/:signed_id`
    * remove a specific image from a users account
    * Requires Header: `Authorization: "Bearer *token* `
  * `POST /visits`
    * Log a new trip and associate it with the current user. Returns the new visit instance as json
    * Requires Header: `Authorization: "Bearer *token* `
  * `GET visits`
    * Returns a list of all visits as JSON.
  * `GET visits/reviews`
    * takes in a param argument of `?code=`
    * Returns all reviews for the park whose park_code matches as JSON.
  * `PATCH visits/:id`
    * Update visit details such as review, score, journal entry, or add new photos. Returns updated visit as JSON.
    * Requires Header: `Authorization: "Bearer *token* `
  * `DELETE visits/:id`
    * Deletes the entire visit and associated photos.
    * Requires Header: `Authorization: "Bearer *token* `

## Contributing
Pull requests are welcome. Please make sure that your PR is <a href="https://www.netlify.com/blog/2020/03/31/how-to-scope-down-prs/">well-scoped</a>. For major changes, please open an issue first to discuss what you would like to change.

### Known issues
* <a href="https://github.com/dsasse07/great-outdoors-guide-backend/issues">Visit Issues Section</a>

### Contributors
<table>
  <tr>
    <td align="center"><a href="https://github.com/dsasse07"><img src="https://avatars1.githubusercontent.com/u/72173601?s=400&u=57e4654c70d63d16bc5b84e2878d97f770672715&v=4" width="200px;" alt="Daniel Sasse"/><br /><sub><b>Daniel Sasse</b></sub></a><br />
    <td></td>
    <td align="center"><a href="https://github.com/BoltVanderhuge"><img src="https://avatars.githubusercontent.com/u/73249559?s=460&u=adaeb89f6348b05852c1c2ce60ed4bb91b94bd60&v=4" width="200px;" alt="John Wisneski"/><br /><sub><b>John Wisneski</b></sub></a><br />
    </tr>