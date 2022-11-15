// Michael T Bolla 
// R#11524524
// Human Computer Interaction Fall 2022, Section 002
// Project 2: Personal Magic Mirror
// Date: Tuesday, November 15, 2022

//Additional Notes:
// In order to run the code, you must complete the following steps.
// Step 1: You must import all the files from the repository involving CSV files, Helvetica-Bold.ttf, as well as the Sunday-morning-mp3.
// Step 2: You must make sure the processing ide has the correct sound library installed, to do this go to tools -> manage tools -> install sound library, in this case you must install the Sound Library - author is the The Processing Foundation.
// Step 3: You must make sure the processing ide has the correct video library installed, to do this go to tools -> manage tools -> install Video library, in this case you must install the video library for processing 4 Library - author is the The Processing Foundation.

// Work Cited / Resources Referenced
// McCaffrey, John. "How to Add Sound to a Processing Project." YouTube, YouTube, 2 Nov. 2020, https://www.youtube.com/watch?v=I6fG1wneXWo&amp;ab_channel=JohnMcCaffrey. 
// Park, John. "Processing Tutorial: Loadtable() and Data Visualization Techniques in Processing." YouTube, YouTube, 11 Mar. 2016, https://www.youtube.com/watch?v=pJthD0t6k1U. 
// Rivkin, Jacob. "CSV Setup + Import into Processing." YouTube, YouTube, 6 Apr. 2020, https://www.youtube.com/watch?v=IewR0ph9nsA&amp;ab_channel=JacobRivkin. 
// Shiffman, Daniel. "11.1: Capture and Live Video - Processing Tutorial." YouTube, YouTube, 24 July 2015, https://www.youtube.com/watch?v=WH31daSj4nc&amp;ab_channel=TheCodingTrain. 

// Music Used & Attribution
// Attribution for the free music download from filmmusic.io
// The following music was used for this media project:
// Music: Sunny Morning by MusicLFiles
// Free download: https://filmmusic.io/song/7813-sunny-morning
// License (CC BY 4.0): https://filmmusic.io/standard-license
// Artist website: https://cemmusicproject.wixsite.com/musiclibraryfiles


import processing.sound.*; //Loads sound library into processing sketch
import processing.video.*; //Loads video library into processing sketch

//CSV Information tables, Created Table objects with variable names to store the data in rows in columns
Table tableCalendar;
Table tableLocalWeather;
Table tableNewsFeed;
Table tableCurrentWeight;
Table tablenotifications;


//Music
SoundFile music; //Built in Class from processing with variable name music which allows playback, Used for the music button

//Video
Capture video; //Built in Class from processing with variable name video to capture the video frames through the capture device in my case a Logitech 1080p C920s Pro HD Webcam

void setup(){
 fullScreen(); //Used Fullscreen for my window to give best representation of a mirror this could change things up on your run through, because my current display is a 3440x1440 monitor
 
 //Loads Specific CSV files created
 tableCalendar = loadTable("PersonalCalendar.csv");
 tableLocalWeather = loadTable("LocalWeather.csv");
 tableNewsFeed = loadTable("NewsFeed.csv");
 tableCurrentWeight = loadTable("CurrentWeight.csv");
 tablenotifications = loadTable("Notifications.csv");
 
 //Music
 //Attribution for the free music download from filmmusic.io
 //The following music was used for this media project:
 //Music: Sunny Morning by MusicLFiles
 //Free download: https://filmmusic.io/song/7813-sunny-morning
 //License (CC BY 4.0): https://filmmusic.io/standard-license
 //Artist website: https://cemmusicproject.wixsite.com/musiclibraryfiles
 music = new SoundFile(this, "sunny-morning-by-musiclfiles-from-filmmusic-io.mp3"); // added the music file to my variable music
 
 //Video setup
 video = new Capture(this,3000,2000,30); //Have my webcam to capture
 video.start(); //starts webcam when program is ran
}

void draw(){
//Begins video loop sets background and forces the background image to be the video from the webcam
 if (video.available()) {
   video.read();
 }
 background(0);
 image(video,0,0);


 //Created font with Helvetica
 fill(255);
 PFont font; //Calls PFont class with variable name font
 font = createFont("Helvetica-Bold.ttf",18); //font being used is Helvetica downloaded as a ttf for the font of the entire screen. 
 textFont(font);
 
 //For loop to load information to the screen from the csv file calendar
 for (int i=0; i<tableCalendar.getRowCount(); i++) {
   text(tableCalendar.getString(i,0),100,25+ i*20);
   text(tableCalendar.getString(i,1),350,25+ i*20);
 }
 //For loop to load information to the screen from the csv file LocalWeather
 for (int i=0; i<tableLocalWeather.getRowCount(); i++) {
   text(tableLocalWeather.getString(i,0),450,25+ i*20);
   text(tableLocalWeather.getString(i,1),600,25+ i*20);
   text(tableLocalWeather.getString(i,2),750,25+ i*20);
 }
 //For loop to load information to the screen from the csv file NewsFeed
 for (int i=0; i<tableNewsFeed.getRowCount(); i++) {
   text(tableNewsFeed.getString(i,0),2000,25+ i*20);
   text(tableNewsFeed.getString(i,1),2200,25+ i*20);
   text(tableNewsFeed.getString(i,2),2370,25+ i*20);
 }
 //For loop to load information to the screen from the csv file CurrentWeight
 for (int i=0; i<tableCurrentWeight.getRowCount(); i++) {
   text(tableCurrentWeight.getString(i,0),100,450+ i*20);
   text(tableCurrentWeight.getString(i,1),250,450+ i*20);
   text(tableCurrentWeight.getString(i,2),400,450+ i*20);
   text(tableCurrentWeight.getString(i,3),550,450+ i*20);
 }
 //For loop to load information to the screen from the csv file Notifications
 for (int i=0; i<tablenotifications.getRowCount(); i++) {
   text(tablenotifications.getString(i,0),2000,200+ i*20);
   text(tablenotifications.getString(i,1),2200,200+ i*20);
 }
 
 // Date
 // Month is a built in Processing function that communicates with the clock on the computer and returns the current month as a value from 1 - 12.
 // Day is a built in Processing function that communicates with the clock on the computer and returns the current day as a value from 1 - 31.
 // Year is a built in Processing function that communicates with the clock on the computer and returns the current year as an integer.
 
  fill(255);
  textSize(50); //set the text size to 50 for Date
  rect(1190,5,290,50,12); //Created a rectangle around the Date to give it more boldness on the screen
  fill(0,0,255);
  text(month(),1200,50);
  if (day() < 10){
    text("0", 1240,50);
  }
  text("/", 1260,50);
  text(day(), 1280,50);
  text("/", 1340,50);
  text(year(), 1360,50);
  
 // Clock Time
 // Hour is a built in Processing function that communicates with the clock on the computer and returns the current hour as a value from  0 - 23.
 // Minute is a built in Processing function that communicates with the clock on the computer and returns the current minute as a value from 0 - 59.
 // Seconds is a built in Processing function that communicates with the clock on the computer and returns the current second as a value from 0 - 59.
 
  fill(255);
  textSize(50); //set the text size to 50 for Time
  rect(1490,5,290,50,12); //Created a rectangle around the Time to give it more boldness on the screen
  fill(0,255,0);
  if (hour() > 12){
    text(hour()-12, 1490, 50);
  }
  else {
    text(hour(), 1500, 50);
  }
  text(":", 1570, 50);
  if (minute() < 10){
    text("0", 1600,50);
  }
  text(minute(), 1630,50);
  text(":", 1665,50);
  text(second(), 1700, 50);
  
  //Creating a Music Button
  fill(0,255,0);
  textSize(50);
  text("Music", 40, 1200);
  fill(0,150,0);
  ellipse(100, 1300, 100, 100);
  if (mousePressed && dist(mouseX, mouseY, 100, 1300) < 50) { //If the user ever clicks on the music button it will play the music that was provided in the SoundFile on line 62
   music.play(); //Plays the music
  }
  
  //Creating a Clear Mirror Button
  fill(255,0,0);
  textSize(50);
  text("Power", 1525, 1200);
  fill(0);
  ellipse(1600, 1300, 100, 100);
  if (mousePressed && dist(mouseX, mouseY, 1600, 1300) < 50) { //If the user presses and holds the power button the screen is cleared allowing the user a basic mirror
   clear(); //clears the screen of all the additional information
  if (video.available()) { //Checks to see if camera is available
  video.read(); //Runs the camera while the screen is cleared continues to utilize a more realistic mirror for a user who doesnt need the additional information.
 }
 // Sets the background image to just the video
 background(0);
 image(video,0,0);
  }
}
