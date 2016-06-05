# Final

##Introduction:

This is a app for music collection and listen.

You could search for albums here.

In the main page, you will see lots of albums with cover image.

You could login as a user and add albums.

Click on the one specific song and you will get more details including the runtime and popularity.

You could also listen any songs you like by clicking the name of each songs.

Click on one album and you will find detail information about them.

Click on an artist and you will see all albums he has and his top 10 tracks (you could listen to a preview too).

As a user, you could also share your moods here. Just click "Community" and discover more.

##Installation:

1. Clone this repository
2. bundle install
3. rake db:migrate 
4. rake db:seed
5. rails s

In case of failure of uploading avatar, try to run:

* brew install graphicsmagick #(os x)
* sudo apt-get install libmagickwand-dev #(ubuntu)

For test, you could use following account:
* email: jack@uchicago.edu
* password: jack

##Public Url:
https://songtywebdev.herokuapp.com/

##Features:
1. The app has been deployed to a public url via heroku.
2. The app is designed in Bootstrap CSS framework.
3. There are some integrations with spotify. The searching and adding function is accomplished by this.
