# Database Design Exercises

## Level 2

### Exercise 1 – YouTube

We will create a simple model for a reduced version of YouTube.

For each user, store a unique identifier:
* Email
* Password
* Username
* Date of birth
* Gender
* Country
* Postal code

A user uploads videos. For each video, store a unique ID:
* Title
* Description
* Size
* Video file name
* Duration
* Thumbnail
* Number of views
* Number of likes
* Number of dislikes

A video can have three different states: public, hidden, and private. A video can have many tags. A tag is identified by a unique ID and name. Track who uploaded the video and when.

A user can create a channel. Each channel has a unique ID:
* Name
* Description
* Creation date

A user can subscribe to other users' channels. A user can like or dislike a video only once. Keep a record of users who liked or disliked a video and when.

A user can create playlists with videos they like. Each playlist has a unique ID:
* Name
* Creation date
* Status (public or private)

A user can comment on a video. Each comment has a unique ID:
* Comment text
* Date/time of posting

A user can like or dislike a comment. Keep a record of users who liked/disliked a comment and when.

## Level 3

### Exercise 1 – Spotify

We will create a simple model for the database needed for Spotify.

There are two types of users: free and premium. For each user, store a unique identifier:
* Email
* Password
* Username
* Date of birth
* Gender
* Country
* Postal code

Premium users have subscriptions. For each subscription, store:
* Start date
* Renewal date
* Payment method (credit card or PayPal)

For credit cards, store card number, expiration month/year, and security code. For PayPal, store the PayPal username. Track all payments made by a premium user during their subscription. For each payment, store:
* Date
* Order number (unique)
* Total

A user can create many playlists. For each playlist, store:
* Title
* Number of songs
* Unique ID
* Creation date

When a user deletes a playlist, it is not removed from the system but marked as deleted. Store the date the playlist was marked as deleted.

There are two types of playlists: active and deleted. An active playlist can be shared with other users, who can add songs to it. Track who added each song and when.

A song belongs to a single album. An album can contain many songs. An album is published by a single artist. An artist can release many albums. For each song, store a unique ID:
* Title
* Duration
* Number of plays

For each album, store a unique ID:
* Title
* Year of release
* Cover image

For each artist, store a unique ID:
* Name
* Artist image

A user can follow many artists. An artist can be related to other artists with similar music. Track favorite albums and songs for each user. A user can mark many albums and songs as favorites.

**Note:** Once the databases are created, fill the tables with sample data to verify that the relationships are correct.

## Resources / Queries for Testing

### Optician:
* List the total invoices of a client in a given period.
* List the different models of glasses sold by an employee during a year.
* List the different suppliers that have successfully provided glasses to the optician.

### Pizzeria:
* List how many products from the "Drinks" category were sold in a specific city.
* List how many orders a specific employee has processed.
