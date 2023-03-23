# JavaServletWebApp


Group Members:
Kord Boniadi,
Hyejeong Shin

The website will open up to our about/home page and can be navigated to different tabs in the top right.

(All Requirements fulfilled)
Requirements:
1. All webpage files in this project were used using JSP and can be found under the webapp folder. All JSP files have been implemented with the java servlet.
2. We used AJAX implementing the zipcode, state, and tax and the codes can be found under the checkout.jsp and script.js files under webappfolder. These functions can be seen after pressing the cart button on the top right after putting some items in the cart. Once typing in the zipcode and state it will automatically show a dropdown of zipcodes and states that you might possibly be typing depending on what you have typed so far. The tax and the total including the tax will automatically update after you type in the zipcode.


How To Compile and Run:
This project is tested and ran using Glassfish. In addition, the database is hosted locally in a docker container.

Requirements:
1. docker
2. maven
3. glassfish
4. java version 17

Build and run:
1. build project using maven build script
2. start docker and spin up a mysql database: ```docker-compose up -d```
   3. to stop the container use: ```docker-compose down```
4. run the project using glassfish

**Note:** All of these steps can be made simple by using Intellij's integration with maven and glassfish