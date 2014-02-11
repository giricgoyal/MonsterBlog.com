/*
Author:Galen Thomas-Ramos
 CS-424;  Fall 2012
 */

import controlP5.*;

PImage divisorLine;
String[] splatterArray;

ListBox countriesBox;

float textPlacementPadX, textPlacementPadY;

float mainMenuPlotX1, mainMenuPlotX2, mainMenuPlotY1, mainMenuPlotY2;
float menuTabTop, menuTabBottom;
float menuTabLeft, menuTabMid, menuTabRight;

float projectTitlePlotX, projectTitlePlotY;

float textEntryMenuPlotX1, textEntryMenuPlotX2, textEntryMenuPlotY1, textEntryMenuPlotY2;
float overviewButtonPlotX1, overviewButtonPlotY1, overviewButtonPlotX2, overviewButtonPlotY2;
float overviewMenuPlotX1, overviewMenuPlotX2, overviewMenuPlotY1, overviewMenuPlotY2;
float overviewExitButtonPlotX1, overviewExitButtonPlotY1, overviewExitButtonPlotX2, overviewExitButtonPlotY2;

String[] filterChoices; // Holds Strings of filter titles
float[] menuButtonTopPlots;
float[] menuButtonBottomPlots;

boolean[] countriesChosen;
boolean allCountryFilterValues;

float[] monsterFilterButtonTopPlots;
float[] monsterFilterButtonBottomPlots;
float[] monsterFilterButtonLeftPlots;
float[] monsterFilterButtonRightPlots;
float monsterFilterBackX1, monsterFilterBackX2, monsterFilterBackY1, monsterFilterBackY2;
boolean[] monstersChosen;
String[] monsterNames;
boolean allMonsterFilterValues;


float[] genreFilterButtonTopPlots;
float[] genreFilterButtonBottomPlots;
float[] genreFilterButtonLeftPlots;
float[] genreFilterButtonRightPlots;
String[] genreNames;
boolean[] genresChosen;
boolean allGenreFilterValues;

float[] formatFilterButtonTopPlots;
float[] formatFilterButtonBottomPlots;
float formatFilterButtonLeftPlot;
float formatFilterButtonRightPlot;
boolean[] formatsChosen;
boolean allFormatFilterValues;
String[] formatNames;


float[] certificationFilterButtonTopPlots;
float[] certificationFilterButtonBottomPlots;
float certificationFilterButtonRightPlot;
float certificationFilterButtonLeftPlot;
String[] certificationNames;
boolean[] certificationsChosen;
boolean allCertificationFilterValues;

float[] budgetFilterButtonTopPlots;
float[] budgetFilterButtonBottomPlots;
float budgetFilterButtonLeftPlot;
float budgetFilterButtonRightPlot;
String[] budgetNames;
boolean[] budgetsChosen;
boolean allBudgetFilterValues;

float menuButtonLeftPlot;
float menuButtonMidPlot;
float menuButtonRightPlot;

float helpButtonPlotX1, helpButtonPlotX2, helpButtonPlotY1, helpButtonPlotY2;
float tableFormButtonPlotX1, tableFormButtonPlotX2, tableFormButtonPlotY1, tableFormButtonPlotY2;
float textEntryButtonPlotX1, textEntryButtonPlotX2, textEntryButtonPlotY1, textEntryButtonPlotY2;
float resetButtonPlotX1, resetButtonPlotX2, resetButtonPlotY1, resetButtonPlotY2;
int currentHelpMenuScreen;

PFont projectTitleFont;
PFont menuItemFont;

PImage splatter1;
PImage splatter2;
PImage splatter3;
PImage splatter4;
PImage splatter5;
PImage splatter6;
PImage splatter7;
PImage splatter8;
PImage splatter9;
PImage splatter10;
PImage chosenSplatter;

float divisorLinePlotX, divisorLinePlotY1, divisorLinePlotY2;

int indexOfChosenSplatter;

boolean timelineMenuChosen;
boolean comparisonGraphMenuChosen;
boolean overviewMenuChosen;
boolean helpMenuChosen;
boolean textEntryMenuChosen;

boolean[] filterButtonChosen;  //Holds boolean values for which filter has been enabled (only one boolean can be true within the array at one time, or none)
boolean filterWasClicked;
boolean filterButtonReset;
boolean resetGraph;

/*
boolean timelineFilterMonsters;
 boolean timelineFilterGenre;
 boolean timelineFilterCountryOfOrigin;
 boolean timelineFilterBudget;
 boolean timelineFilterFormat;
 boolean timelineFilterFilmRating;
 boolean timelineFilterBudgetCategory;
 boolean timelineFilterIMDBRating;
 boolean timelineFilterIMDBVotes
 
 boolean comparisonGraphFilterMonsters;
 boolean comparisonGraphFilterGenre
 boolean comparisonGraphFilterCountryOfOrign
 boolean comparisonGraphFilterBudget
 boolean comparisonGraphFilterFormat
 boolean comparisonGraphFilterFilmRating
 boolean comparisonGraphFilterBudgetCategory;
 boolean comparisonGraphFilterIMDBRating;
 boolean comparisonGraphFilterIMDBVotes
 */

boolean splatterHasBeenChosen;

void definePlots() {
  //
  //
  //PLOTS FOR MENUS
  mainMenuPlotX1 = divisorLinePlotX + (scaleFactor * 10);
  mainMenuPlotY1 = graphPlotY1 + (scaleFactor * 130);
  mainMenuPlotX2 = width - (scaleFactor * 10);
  mainMenuPlotY2 = graphPlotY2 + (scaleFactor * 40);

  projectTitlePlotX = width - (scaleFactor * 10);
  projectTitlePlotY = (scaleFactor * 20);

  divisorLinePlotX = graphPlotX2 + (scaleFactor * 150);
  divisorLinePlotY1 = 0;
  divisorLinePlotY2 = height;

  menuButtonTopPlots = new float[4];      //Holds top positions of menu buttons for both menus
  menuButtonBottomPlots = new float[4];   //Holds bottom positions of menu buttons for both menus
  menuButtonLeftPlot = mainMenuPlotX1 + (scaleFactor * 10);
  menuButtonRightPlot = mainMenuPlotX2 - (scaleFactor * 10);
  menuButtonMidPlot = ((menuButtonRightPlot - menuButtonLeftPlot) / 2) + menuButtonLeftPlot;


  menuTabTop = mainMenuPlotY1 - (scaleFactor * 30);
  menuTabBottom = mainMenuPlotY1;
  menuTabLeft = mainMenuPlotX1;
  menuTabMid = mainMenuPlotX1 + ((mainMenuPlotX2 - mainMenuPlotX1) / 2);
  menuTabRight = mainMenuPlotX2;

  //
  //
  //Populate menuButtons bottom and top coords
  float tempCoord = mainMenuPlotY1 + (scaleFactor * 10);
  for (int i = 0; i < 4; i++) {
    menuButtonTopPlots[i] = tempCoord;
    menuButtonBottomPlots[i] = tempCoord + (scaleFactor * 40);
    tempCoord = menuButtonBottomPlots[i] + (scaleFactor * 10);
  }

  //
  //
  //Overview Menu/ button stuff
  overviewMenuPlotX1 = (scaleFactor * 5);
  overviewMenuPlotX2 = width - (scaleFactor * 5);
  overviewMenuPlotY1 = (scaleFactor * 5);
  overviewMenuPlotY2 = height - (scaleFactor * 5);

  overviewExitButtonPlotX1 = width - (scaleFactor * 200);
  overviewExitButtonPlotY1 = height - (scaleFactor * 70);
  overviewExitButtonPlotX2 = width - (scaleFactor * 30);
  overviewExitButtonPlotY2 = height - (scaleFactor * 30);

  overviewButtonPlotX1 = width - (scaleFactor * 150);
  overviewButtonPlotY1 = projectTitlePlotY + (scaleFactor * 32);
  overviewButtonPlotX2 = projectTitlePlotX;
  overviewButtonPlotY2 = projectTitlePlotY + (scaleFactor * 62);

  //
  //
  //Text entry menu plot stuff
  textEntryMenuPlotX1 = graphPlotMidX - scaleFactor * 300;
  textEntryMenuPlotY1 = graphPlotY1 + (scaleFactor * 30);
  textEntryMenuPlotX2 = width - scaleFactor * 10;
  textEntryMenuPlotY2 = height - scaleFactor * 10;


  //
  //
  //Other Button Plots
  helpButtonPlotX2 = mainMenuPlotX2;
  helpButtonPlotX1 =  helpButtonPlotX2 - (scaleFactor * 130);
  helpButtonPlotY2 = height - (scaleFactor * 10);
  helpButtonPlotY1 = helpButtonPlotY2 - (scaleFactor * 40);

  tableFormButtonPlotX2 = mainMenuPlotX2 - (scaleFactor * 10);
  tableFormButtonPlotX1 = tableFormButtonPlotX2 - (scaleFactor * 130);
  tableFormButtonPlotY2 = mainMenuPlotY2 - (scaleFactor * 10);
  tableFormButtonPlotY1 = tableFormButtonPlotY2 - (scaleFactor * 40);

  textEntryButtonPlotX1 = divisorLinePlotX + (scaleFactor * 10);
  textEntryButtonPlotX2 = textEntryButtonPlotX1 + (scaleFactor * 150);
  textEntryButtonPlotY2 = helpButtonPlotY2;
  textEntryButtonPlotY1 = textEntryButtonPlotY2 - (scaleFactor * 40);

  resetButtonPlotX2 = divisorLinePlotX - (scaleFactor * 10);
  resetButtonPlotX1 = resetButtonPlotX2 - (scaleFactor * 60);
  resetButtonPlotY2 = textEntryButtonPlotY2;
  resetButtonPlotY1 = textEntryButtonPlotY1;


  //
  //
  //PLOTS FOR MONSTER FILTER BUTTONS
  monsterFilterButtonTopPlots = new float[7];
  monsterFilterButtonBottomPlots = new float[7];
  monsterFilterButtonLeftPlots = new float[7];
  monsterFilterButtonRightPlots = new float[7];

  float topTemp = graphPlotY1 + (scaleFactor * 10);
  float bottomTemp = topTemp + (scaleFactor * 40);
  float leftTemp = graphPlotX1 + (scaleFactor * 110);
  float rightTemp = leftTemp + (scaleFactor * 130);

  for ( int i = 0; i < 7; i++) {              //Populate Top, Bottom, Left and Right arrays which hold coords of monster filter buttons
    monsterFilterButtonTopPlots[i] = topTemp;
    monsterFilterButtonBottomPlots[i] = bottomTemp;
    monsterFilterButtonLeftPlots[i] = leftTemp;
    monsterFilterButtonRightPlots[i] = rightTemp;

    topTemp = bottomTemp + (scaleFactor * 10);
    bottomTemp = topTemp + (scaleFactor * 40);
    leftTemp = rightTemp + (scaleFactor * 20);
    rightTemp = leftTemp + (scaleFactor * 130);
  }

  monsterFilterBackX1 = divisorLinePlotX - (scaleFactor * 150);
  monsterFilterBackX2 = monsterFilterBackX1 + (scaleFactor * 130);
  monsterFilterBackY1 = height - (scaleFactor * 80);
  monsterFilterBackY2 = monsterFilterBackY1 + (scaleFactor * 40);



  genreFilterButtonTopPlots = new float[9];
  genreFilterButtonBottomPlots = new float[9];
  genreFilterButtonLeftPlots = new float[3];
  genreFilterButtonRightPlots = new float[3];

  float genreTopTemp = 0 + (scaleFactor * 20);
  float genreLeftTemp = graphPlotMidX + (scaleFactor * 195);

  for (int i = 0; i < 9; i++) {        //For top and bottom coords of genre filter buttons
    genreFilterButtonTopPlots[i] = genreTopTemp;
    genreFilterButtonBottomPlots[i] = genreFilterButtonTopPlots[i] + (scaleFactor * 38);

    genreTopTemp = genreFilterButtonBottomPlots[i] + (scaleFactor * 10);
  }

  for (int i = 0; i < 3; i++) {        //For Left and right coords of genre filter buttons
    genreFilterButtonLeftPlots[i] = genreLeftTemp;
    genreFilterButtonRightPlots[i] = genreFilterButtonLeftPlots[i] + (scaleFactor * 135);

    genreLeftTemp = genreFilterButtonRightPlots[i] + (scaleFactor * 20);
  }

  float tempTop = graphPlotMidY - (scaleFactor * 50);
  float tempBottom = tempTop + (scaleFactor * 40);

  formatFilterButtonTopPlots = new float[4];
  formatFilterButtonBottomPlots = new float[4];
  formatFilterButtonLeftPlot = divisorLinePlotX - (scaleFactor * 170);
  formatFilterButtonRightPlot = divisorLinePlotX - (scaleFactor * 15);

  budgetFilterButtonTopPlots = new float[4];
  budgetFilterButtonBottomPlots = new float[4];
  budgetFilterButtonLeftPlot = divisorLinePlotX - (scaleFactor * 170);
  budgetFilterButtonRightPlot = divisorLinePlotX - (scaleFactor * 15);

  for ( int i = 0; i < 4; i++) { 
    formatFilterButtonTopPlots[i] = tempTop;
    formatFilterButtonBottomPlots[i] = tempBottom;

    budgetFilterButtonTopPlots[i] = tempTop;
    budgetFilterButtonBottomPlots[i] = tempBottom;

    tempTop = tempBottom + (scaleFactor * 10);
    tempBottom = tempTop + (scaleFactor * 40);
  }

  certificationFilterButtonTopPlots = new float[6];
  certificationFilterButtonBottomPlots = new float[6];
  certificationFilterButtonLeftPlot = divisorLinePlotX - (scaleFactor * 170);
  certificationFilterButtonRightPlot = divisorLinePlotX - (scaleFactor * 15);

  float certificationTopTemp = graphPlotMidY - (scaleFactor * 90);

  for ( int i = 0; i < 6; i++) { 
    certificationFilterButtonTopPlots[i] = certificationTopTemp;
    certificationFilterButtonBottomPlots[i] = certificationFilterButtonTopPlots[i] + (scaleFactor * 40);

    certificationTopTemp = certificationFilterButtonBottomPlots[i] + (scaleFactor * 10);
  }
}

void drawLayout() {
  definePlots();

  textPlacementPadX = scaleFactor * 10;
  textPlacementPadY = scaleFactor * 2;

  //CODE FOR SPLATTER METHOD

  drawProjectTitle(); 
  strokeWeight(scaleFactor * 4);
  fill(359, 67, 92);

  menuItemFont = createFont("SansSerif", (scaleFactor * 16));
  textFont(menuItemFont);

  drawMenuTabs();
  drawMenu();
  //drawOverviewButton();

  // CP5 CODE FOR LISTBOX
  countriesBox = controlP5.addListBox("countriesList")
    .setPosition(divisorLinePlotX - (scaleFactor * 205), scaleFactor * 40)
      .setSize(scaleFactor * 180, scaleFactor * 400)
        .setItemHeight(scaleFactor * 20)
          .setBarHeight(scaleFactor * 22)
            .setColorBackground(color(264, 98, 61))
              .addItems(CountryList)
                ;

  countriesBox.setVisible(false);
  countriesBox.captionLabel().toUpperCase(true);
  countriesBox.captionLabel().set("Countries Filter");
  countriesBox.captionLabel().setColor(color(360));
  countriesBox.captionLabel().style().marginTop = 3;
  countriesBox.valueLabel().style().marginTop = 3;
  
  



  //CP5 CODE FOR LISTBOX

  imageMode(CORNER);
  divisorLine = loadImage("divisorline.png");
  image(divisorLine, divisorLinePlotX, divisorLinePlotY1);

  if (filterWasClicked) {
    int count = 0;
    /* for (boolean g: filterButtonChosen)
     {
     println("boolean value # " + count +" within filter button array is: " + g);
     count++;
     }
     println();   */
    drawPopUpFilter();
  }

  if (overviewMenuChosen) {
    drawOverviewMenu();
  }
  if (helpMenuChosen) {
    drawHelpMenu();
  }
 /* if (textEntryMenuChosen) {
    println("Entered the conditional in drawLayout."); //isn't entering here
    drawTextEntryMenu();
  } */
}



void drawMenu() { 

  filterChoices = new String [8];

  filterChoices[0] = "Monsters";
  filterChoices[1] = "Country of Origin";
  filterChoices[2] = "Genre";
  filterChoices[3] = "Format";
  filterChoices[4] = "Certification";
  filterChoices[5] = "Budget Category";
  filterChoices[6] = "IMDB Rating";
  filterChoices[7] = "IMDB No. of Votes";

  monsterNames = new String[44];

  int inc = 1;

  monsterNames[0] = "All Keywords";
  monsterNames[inc + 0] ="Alien";
  monsterNames[inc + 1] ="Anaconda";
  monsterNames[inc + 2] ="Android";
  monsterNames[inc + 3] ="Bigfoot";
  monsterNames[inc + 4] ="Cyclops";
  monsterNames[inc + 5] ="Demon";
  monsterNames[inc + 6] ="Devil";
  monsterNames[inc + 7] ="Dinosaur";
  monsterNames[inc + 8] ="Dracula";
  monsterNames[inc + 9] ="Dragon";
  monsterNames[inc + 10] ="Frankenstein's-monster";
  monsterNames[inc + 11] ="Freddy-Krueger";
  monsterNames[inc + 12] ="Ghost";
  monsterNames[inc + 13] ="Giant-Ape";
  monsterNames[inc + 14] ="Giant-Insect";
  monsterNames[inc + 15] ="Giant-Snake";
  monsterNames[inc + 16] ="Giant-Spider";
  monsterNames[inc + 17] ="Goblin";
  monsterNames[inc + 18] ="Godzilla";
  monsterNames[inc + 19] ="Invisible-man";
  monsterNames[inc + 20] ="King-Kong";
  monsterNames[inc + 21] ="Lake-Monster";
  monsterNames[inc + 22] ="Mermaid";
  monsterNames[inc + 23] ="Monster";
  monsterNames[inc + 24] ="Monster-Plant";
  monsterNames[inc + 25] ="Mummy";
  monsterNames[inc + 26] ="Mutant";
  monsterNames[inc + 27] ="Ogre";
  monsterNames[inc + 28] ="Orc";
  monsterNames[inc + 29] ="Phantom";
  monsterNames[inc + 30] ="Predator";
  monsterNames[inc + 31] ="Robot";
  monsterNames[inc + 32] ="Sasquatch";
  monsterNames[inc + 33] ="Satan";
  monsterNames[inc + 34] ="Sea-Monster";
  monsterNames[inc + 35] ="Shape-Shifting-Alien";
  monsterNames[inc + 36] ="Troll";
  monsterNames[inc + 37] ="Vampire";
  monsterNames[inc + 38] ="Werewolf";
  monsterNames[inc + 39] ="Witch";
  monsterNames[inc + 40] ="Xenomorph";
  monsterNames[inc + 41] ="Yeti";
  monsterNames[inc + 42] ="Zombie";

  formatNames = new String[4];

  formatNames[0] = "All Formats";
  formatNames[1] = "Direct to Video Release";
  formatNames[2] = "Movie";
  formatNames[3] = "Tv Series";

  certificationNames = new String[6];

  certificationNames[0] = "All Certifications";
  certificationNames[1] = "G";
  certificationNames[2] = "PG";
  certificationNames[3] = "PG-13";
  certificationNames[4] = "R";
  certificationNames[5] = "NC-17";     

  budgetNames = new String[4];

  budgetNames[0] = "All Budget";
  budgetNames[1] = "No Budget";
  budgetNames[2] = "Low budget";
  budgetNames[3] = "High Budget";

  divisorLine = loadImage("divisorline.png");

  if (timelineMenuChosen) {
    strokeWeight(int(scaleFactor * 5));// Main menu box Green - filter graph
    stroke(340);
    fill(340, 80);
    rectMode(CORNERS);
    rect(mainMenuPlotX1, mainMenuPlotY1, mainMenuPlotX2, mainMenuPlotY2, (scaleFactor * 6));

    drawTimelineMenuButtons();
  }
  else if (comparisonGraphMenuChosen) {
    strokeWeight(int(scaleFactor * 5));// Main menu box Purple - alt graph
    stroke(50);
    fill(50, 80);
    rectMode(CORNERS);
    rect(mainMenuPlotX1, mainMenuPlotY1, mainMenuPlotX2, mainMenuPlotY2, (scaleFactor * 6));

    drawComparisonGraphMenuButtons();
  }

  drawBottomButtons();
}


void drawBottomButtons() { //Help, text entry, and Cluster data form buttons

    strokeWeight(int(scaleFactor * 5)); 
  rectMode(CORNERS);
  textFont(menuItemFont);

  /*
  //Cluster data button
   stroke(272, 62, 79);
   fill(272, 62, 79, 99);
   rect(tableFormButtonPlotX1, tableFormButtonPlotY1, tableFormButtonPlotX2, tableFormButtonPlotY2, scaleFactor * 3);
   fill(340);
   text("Cluster Data", tableFormButtonPlotX1 + textPlacementPadX, tableFormButtonPlotY1 + textPlacementPadY + (scaleFactor * 5));
   */

 /* //Text Entry
  stroke(210, 56, 97);
  fill(210, 56, 97, 99);
  rect(textEntryButtonPlotX1, textEntryButtonPlotY1, textEntryButtonPlotX2, textEntryButtonPlotY2, scaleFactor * 3);
  fill(340);
  text("Movie Title Search", textEntryButtonPlotX1 + textPlacementPadX, textEntryButtonPlotY1 + textPlacementPadY + (scaleFactor * 5));

*/
  //Reset Button
  stroke( 255, 85, 63);
  fill(255, 85, 63, 99);
  rect(resetButtonPlotX1, resetButtonPlotY1, resetButtonPlotX2, resetButtonPlotY2, scaleFactor * 3);
  fill(340);
  text("Reset", resetButtonPlotX1 + textPlacementPadX, resetButtonPlotY1 + textPlacementPadY + (scaleFactor * 5));

  //Help button
  stroke(359, 87, 83);
  fill(359, 87, 83, 99);
  rect(helpButtonPlotX1, helpButtonPlotY1, helpButtonPlotX2, helpButtonPlotY2, scaleFactor * 3);
  fill(340);
  text("Help & Credits", helpButtonPlotX1 + textPlacementPadX, helpButtonPlotY1 + textPlacementPadY + (scaleFactor * 5));
}


void drawTimelineMenuButtons() {
  strokeWeight(int(scaleFactor * 5));// Main menu box Green buttons
  stroke(340);
  rectMode(CORNERS);

  textFont(menuItemFont);
  textAlign(LEFT, TOP);

  for (int i = 0; i < 4; i++) {
    if (!filterButtonChosen[i]) {
      fill(350, 80);
      rect(menuButtonLeftPlot, menuButtonTopPlots[i], menuButtonMidPlot - (scaleFactor * 5), menuButtonBottomPlots[i], (scaleFactor * 6));//Left Column of buttons

      fill(50);
      text(filterChoices[i], menuButtonLeftPlot + textPlacementPadX, menuButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 5));
    }

    else {
      fill(250, 99);
      rect(menuButtonLeftPlot, menuButtonTopPlots[i], menuButtonMidPlot - (scaleFactor * 5), menuButtonBottomPlots[i], (scaleFactor * 6));//Left Column of buttons

      fill(90);
      text(filterChoices[i], menuButtonLeftPlot + textPlacementPadX, menuButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 5));
    }
  }

  for (int j = 0; j < 4; j++) {
    if (!filterButtonChosen[j + 4]) {
      fill(350, 80);
      rect(menuButtonMidPlot + (scaleFactor * 5), menuButtonTopPlots[j], menuButtonRightPlot, menuButtonBottomPlots[j], (scaleFactor * 6));//Right Column of buttons

      fill(50);
      text(filterChoices[j + 4], menuButtonMidPlot + textPlacementPadX, menuButtonTopPlots[j] + textPlacementPadY  + (scaleFactor * 5));
    }
    else {
      fill(250, 99);
      rect(menuButtonMidPlot + (scaleFactor * 5), menuButtonTopPlots[j], menuButtonRightPlot, menuButtonBottomPlots[j], (scaleFactor * 6));//Right Column of buttons

      fill(90);
      text(filterChoices[j + 4], menuButtonMidPlot + textPlacementPadX, menuButtonTopPlots[j] + textPlacementPadY  + (scaleFactor * 5));
    }
  }
}


void drawComparisonGraphMenuButtons() {

  strokeWeight(int(scaleFactor * 5));// Main menu box Purple buttons
  stroke(50);

  rectMode(CORNERS);

  textFont(menuItemFont);
  textAlign(LEFT, TOP);

  for (int i = 0; i < 4; i++) {
    if (!filterButtonChosen[i]) {
      fill(80, 80);
      rect(menuButtonLeftPlot, menuButtonTopPlots[i], menuButtonMidPlot - (scaleFactor * 5), menuButtonBottomPlots[i], (scaleFactor * 6));//Left Column of buttons

      fill(340);
      text(filterChoices[i], menuButtonLeftPlot + textPlacementPadX, menuButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 5));
    }
    else {
      fill(0, 99);
      rect(menuButtonLeftPlot, menuButtonTopPlots[i], menuButtonMidPlot - (scaleFactor * 5), menuButtonBottomPlots[i], (scaleFactor * 6));//Left Column of buttons

      fill(300);
      text(filterChoices[i], menuButtonLeftPlot + textPlacementPadX, menuButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 5));
    }
  }

  for (int j = 0; j < 4; j++) {
    if (!filterButtonChosen[j+4]) {
      fill(80, 80);
      rect(menuButtonMidPlot + (scaleFactor * 5), menuButtonTopPlots[j], menuButtonRightPlot, menuButtonBottomPlots[j], (scaleFactor * 6));//Right Column of buttons

      fill(340);
      text(filterChoices[j + 4], menuButtonMidPlot + textPlacementPadX, menuButtonTopPlots[j] + textPlacementPadY  + (scaleFactor * 5));
    }
    else {
      fill(0, 99);
      rect(menuButtonMidPlot + (scaleFactor * 5), menuButtonTopPlots[j], menuButtonRightPlot, menuButtonBottomPlots[j], (scaleFactor * 6));//Right Column of buttons

      fill(300);
      text(filterChoices[j + 4], menuButtonMidPlot + textPlacementPadX, menuButtonTopPlots[j] + textPlacementPadY  + (scaleFactor * 5));
    }
  }
}


void drawProjectTitle() {


  projectTitleFont = createFont("SansSerif", (scaleFactor * 40)); 
  noStroke();
  fill(340, 99.9);
  rect(divisorLinePlotX + scaleFactor * 10, 0, width, overviewButtonPlotY1, 0, 0, 0, scaleFactor * 6);
  rect(overviewButtonPlotX1 - scaleFactor * 10, overviewButtonPlotY1, width, overviewButtonPlotY2 + scaleFactor * 10, 0, 0, 0, scaleFactor * 6);

  fill(0);
  textAlign(RIGHT, CENTER);
  textFont(projectTitleFont);
  text("MonsterBlog.com", projectTitlePlotX, projectTitlePlotY);
}

void drawPopUpFilter() {      
  for (int i = 0; i < 8; i++) {
    if (filterButtonChosen[i]) {
      if ( i == 0) {              //Draw popup rect layer for MONSTERS

        strokeWeight(int(scaleFactor * 5));
        stroke(359, 85, 85);
        fill(359, 85, 85, 99);
        rectMode(CORNERS);
        rect(graphPlotX1 + (scaleFactor * 100), graphPlotY1, divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 40), (scaleFactor * 6));

        drawMonsterFilterButtons();
      } 
      if ( i == 1) {              //Draw popup rect layer for  COUNTRY OF ORIGIN-- will be using listbox

        strokeWeight(int(scaleFactor * 5));
        stroke(274, 52, 86);
        fill(274, 52, 86, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 215), 0 + (scaleFactor * 10), divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 10), (scaleFactor * 6));

        countriesBox.setVisible(true);
      } 
      if ( i == 2) {              //Draw popup rect layer for  GENRES

        strokeWeight(int(scaleFactor * 5));
        stroke(224, 59, 86);
        fill(224, 59, 86, 99);
        rectMode(CORNERS);
        rect(graphPlotMidX + (scaleFactor * 185), 0 + (scaleFactor * 10), divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 10), (scaleFactor * 6));

        drawGenreFilterButtons();
      } 
      if ( i == 3) {              //Draw popup rect layer for FORMAT

        strokeWeight(int(scaleFactor * 5));
        stroke(55, 78, 95);
        fill(55, 78, 95, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 180), graphPlotMidY - (scaleFactor * 60), divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 85), (scaleFactor * 6));

        drawFormatFilterButtons();
      } 
      if ( i == 4) {              //Draw popup rect layer for CERTIFICATIONS

        strokeWeight(int(scaleFactor * 5));
        stroke(41, 63, 99);
        fill(41, 63, 99, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 180), graphPlotMidY - (scaleFactor * 100), divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 25), (scaleFactor * 6));

        drawCertificationFilterButtons();
      } 
      if ( i == 5) {              //Draw popup rect layer for BUDGET CATEGORY

        strokeWeight(int(scaleFactor * 5));
        stroke(123, 65, 84);
        fill(123, 65, 84, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 180), graphPlotMidY - (scaleFactor * 60), divisorLinePlotX - (scaleFactor * 5), height - (scaleFactor * 85), (scaleFactor * 6));

        drawBudgetFilterButtons();
      } 
      if ( i == 6) {              //Draw popup rect layer for IMDB RATING -- range slider

        strokeWeight(int(scaleFactor * 5));
        stroke(182, 27, 95);
        fill(182, 27, 95, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 100), graphPlotY1, divisorLinePlotX - (scaleFactor * 5), mainMenuPlotY2, scaleFactor * 6);

        // ratingVSlider1 = new VScrollbar(int(divisorLinePlotX - (scaleFactor * 30)), int(graphPlotY2 -(scaleFactor * 10)), int(scaleFactor * 40), int(scaleFactor * 10), 4);
        //ratingVSlider2 = new VScrollbar(int(divisorLinePlotX - (scaleFactor * 40)), int(graphPlotY2 + (scaleFactor * 10)), int(scaleFactor * 10), int((graphPlotY1 - mainMenuPlotY2) - (scaleFactor * 20)), 4);

        // ratingVSlider1.update();
        //ratingVSlider2.update();
        // ratingVSlider1.display();
        //ratingVSlider2.display();
      } 
      if ( i == 7) {              //Draw popup rect layer for IMDB VOTES -- range slider

        strokeWeight(int(scaleFactor * 5));
        stroke(303, 35, 91);
        fill(303, 35, 91, 99);
        rectMode(CORNERS);
        rect(divisorLinePlotX - (scaleFactor * 100), graphPlotY1, divisorLinePlotX - (scaleFactor * 5), mainMenuPlotY2, scaleFactor * 6);
      }
    }
  }
}

void drawBudgetFilterButtons() {
  strokeWeight(scaleFactor * 4);

  textFont(menuItemFont);
  textSize(scaleFactor * 10);
  textAlign(LEFT, TOP);

  for (int i = 0; i < 4; i++) {
    if (!budgetsChosen[i]) {
      fill(123, 65, 84, 99);
      rect(budgetFilterButtonLeftPlot, budgetFilterButtonTopPlots[i], budgetFilterButtonRightPlot, budgetFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(340);
      text(budgetNames[i], budgetFilterButtonLeftPlot + textPlacementPadX, budgetFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
    else {
      fill(124, 90, 39, 99);
      rect(budgetFilterButtonLeftPlot, budgetFilterButtonTopPlots[i], budgetFilterButtonRightPlot, budgetFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(280);
      text(budgetNames[i], budgetFilterButtonLeftPlot + textPlacementPadX, budgetFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
  }
}

void drawCertificationFilterButtons() {
  strokeWeight(scaleFactor * 4);

  textFont(menuItemFont);
  textSize(scaleFactor * 10);
  textAlign(LEFT, TOP);

  for (int i = 0; i < 6; i++) {
    if (!certificationsChosen[i]) {
      fill(41, 63, 99, 80);
      rect(certificationFilterButtonLeftPlot, certificationFilterButtonTopPlots[i], certificationFilterButtonRightPlot, certificationFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(50);
      text(certificationNames[i], certificationFilterButtonLeftPlot + textPlacementPadX, certificationFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
    else {
      fill(41, 76, 77, 80);
      rect(certificationFilterButtonLeftPlot, certificationFilterButtonTopPlots[i], certificationFilterButtonRightPlot, certificationFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(20);
      text(certificationNames[i], certificationFilterButtonLeftPlot + textPlacementPadX, certificationFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
  }
}


void drawGenreFilterButtons() {
  strokeWeight(scaleFactor * 4);
  stroke(224, 59, 86);

  textFont(menuItemFont);
  textSize(scaleFactor * 10);
  textAlign(LEFT, TOP);
  int textCounter = 0;

  for (int i = 0; i < 9; i++) {   // each row of genre buttons (3 buttons to a row)

    for (int j = 0; j < 3; j++) {  // each column of gere buttons
      if (!genresChosen[textCounter]) {
        fill(224, 59, 86, 80);
        rect(genreFilterButtonLeftPlots[j], genreFilterButtonTopPlots[i], genreFilterButtonRightPlots[j], genreFilterButtonBottomPlots[i], scaleFactor * 3);

        fill(340);
        text(GenreList[textCounter], genreFilterButtonLeftPlots[j] + textPlacementPadX, genreFilterButtonTopPlots[i]  + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(224, 67, 63, 80);
        rect(genreFilterButtonLeftPlots[j], genreFilterButtonTopPlots[i], genreFilterButtonRightPlots[j], genreFilterButtonBottomPlots[i], scaleFactor * 3);

        fill(280);
        text(GenreList[textCounter], genreFilterButtonLeftPlots[j] + textPlacementPadX, genreFilterButtonTopPlots[i]  + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;
    }
  }
}


void drawMonsterFilterButtons() {
  strokeWeight(scaleFactor * 4);
  fill(359, 67, 92);

  textFont(menuItemFont);
  textSize(scaleFactor * 10);
  textAlign(LEFT, TOP);
  int textCounter = 0;

  for (int j = 0; j < 7; j++) {


    if (j != 6) {

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[0], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[0], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[0] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[0], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[0], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[0] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[1], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[1], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[1] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[1], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[1], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[1] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[2], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[2], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[2] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[2], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[2], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[2] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[3], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[3], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[3] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[3], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[3], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[3] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[4], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[4], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[4] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[4], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[4], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[4] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[5], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[5], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[5] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[5], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[5], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[5] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);
        rect(monsterFilterButtonLeftPlots[6], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[6], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[6] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);
        rect(monsterFilterButtonLeftPlots[6], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[6], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[6] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;
    }


    else {      //if j == 6

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);  //Last monster filter button; zombie
        rect(monsterFilterButtonLeftPlots[0], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[0], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[0] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);  //Last monster filter button; zombie
        rect(monsterFilterButtonLeftPlots[0], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[0], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[0] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      textCounter++;

      if (!monstersChosen[textCounter]) {
        fill(359, 67, 92, 90);  //Last monster filter button; zombie
        rect(monsterFilterButtonLeftPlots[1], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[1], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(340);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[1] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
      else {
        fill(358, 72, 70, 90);  //Last monster filter button; zombie
        rect(monsterFilterButtonLeftPlots[1], monsterFilterButtonTopPlots[j], monsterFilterButtonRightPlots[1], monsterFilterButtonBottomPlots[j], scaleFactor * 3);
        fill(180);
        text(monsterNames[textCounter], monsterFilterButtonLeftPlots[1] + textPlacementPadX, monsterFilterButtonTopPlots[j] + textPlacementPadY + (scaleFactor * 8));
      }
    }
  }
}

void drawFormatFilterButtons() {

  strokeWeight(scaleFactor * 4);

  textFont(menuItemFont);
  textSize(scaleFactor * 10);
  textAlign(LEFT, TOP);

  for (int i = 0; i < 4; i++) {
    if (!formatsChosen[i]) {
      fill(57, 92, 95, 99);
      rect(formatFilterButtonLeftPlot, formatFilterButtonTopPlots[i], formatFilterButtonRightPlot, formatFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(50);
      text(formatNames[i], formatFilterButtonLeftPlot + textPlacementPadX, formatFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
    else {
      fill(57, 81, 59, 99);
      rect(formatFilterButtonLeftPlot, formatFilterButtonTopPlots[i], formatFilterButtonRightPlot, formatFilterButtonBottomPlots[i], (scaleFactor * 6));
      fill(20);
      text(formatNames[i], formatFilterButtonLeftPlot + textPlacementPadX, formatFilterButtonTopPlots[i] + textPlacementPadY + (scaleFactor * 8));
    }
  }
}

void drawHelpMenu() {
  

  strokeWeight(int(scaleFactor * 10));//overview menu 
  stroke(359, 80, 79);
  fill(0, 60);
  rectMode(CORNERS);
  rect(overviewMenuPlotX1, overviewMenuPlotY1, overviewMenuPlotX2, overviewMenuPlotY2, (scaleFactor * 6));

  strokeWeight(int(scaleFactor * 5));// overview menu "back to menus button"
  stroke(359, 80, 79);
  fill(0, 95);
  rectMode(CORNERS);
  rect(overviewExitButtonPlotX1, overviewExitButtonPlotY1, overviewExitButtonPlotX2, overviewExitButtonPlotY2, (scaleFactor * 3));

  fill(340);
  textSize(scaleFactor * 18);
  textAlign(LEFT, BOTTOM);
  
  text("Credit:\nChihua Ma - Graph Coding and Implementation\nGalen Thomas-Ramos - UI Layout and Coding\nGiric Goyal - Data Mining and Website", scaleFactor * 40, height - (scaleFactor * 40));

  fill(340);
  textSize(scaleFactor * 20);
  textAlign(LEFT, TOP);
  text("Back to Menus", overviewExitButtonPlotX1 + textPlacementPadX, overviewExitButtonPlotY1 + textPlacementPadY + (scaleFactor * 3));


  fill(340);
  textSize(scaleFactor * 16);
  textAlign(LEFT, BOTTOM);

  text("The Y axis.\nThe unit of measure is always\nthe number of monster movies.", graphPlotX11 + scaleFactor * 20, ((graphPlotY2 - graphPlotY1) / 2) + graphPlotY1 - scaleFactor * 10);
  arrowLine(graphPlotX11 + (scaleFactor * 10), ((graphPlotY2 - graphPlotY1) / 2) + graphPlotY1, graphPlotX11 + scaleFactor * 130, ((graphPlotY2 - graphPlotY1) / 2) + graphPlotY1, radians(30), 0, true);  //Arrow to y Axis

  text("The X axis.\nThe unit of measure is always\nin years.", graphPlotMidX - scaleFactor * 40, graphPlotY2 - (scaleFactor * 60));
  arrowLine(graphPlotMidX - scaleFactor * 40, graphPlotY2 - (scaleFactor * 10), graphPlotMidX, graphPlotY2 - (scaleFactor * 50), radians(30), 0, true);  //Arrow to X Axis

  //arrowLine(overviewButtonPlotX1 - (scaleFactor * 10), overviewButtonPlotY1 + scaleFactor * 10, overviewButtonPlotX1 - (scaleFactor * 100), overviewButtonPlotY1 + scaleFactor * 10, radians(30), 0, true); //overview
  
    fill(340);
  textSize(scaleFactor * 16);
  textAlign(RIGHT, BOTTOM);
  
  text("Filters to choose from.", menuButtonLeftPlot - scaleFactor * 90, menuButtonTopPlots[0] + scaleFactor * 40);
  
  for (int i = 0; i < 4; i++) {
    arrowLine(menuButtonLeftPlot - scaleFactor * 10, menuButtonTopPlots[i] + scaleFactor * 20, menuButtonLeftPlot - scaleFactor * 80, menuButtonTopPlots[0] + scaleFactor * 40, radians(30), 0, true);// arrows to filter buttons
  }




  text("Resets the current graph", resetButtonPlotX1 - scaleFactor * 60, resetButtonPlotY1 - scaleFactor * 60);
  arrowLine(resetButtonPlotX1, resetButtonPlotY1 - scaleFactor * 10, resetButtonPlotX1 - scaleFactor * 50, resetButtonPlotY1 - scaleFactor * 50, radians(30), 0, true);  //Arrow to Reset button

  stroke(359, 34, 90);

  text("Switch between clustering data and line graph data.", menuTabLeft - scaleFactor * 140, menuTabTop - scaleFactor * 40);
  arrowLine(menuTabLeft - scaleFactor * 10, menuTabTop, menuTabLeft - scaleFactor * 130, menuTabTop - scaleFactor * 30, radians(30), 0, true); 
  arrowLine(menuTabMid - scaleFactor * 10, menuTabTop, menuTabLeft - scaleFactor * 130, menuTabTop - scaleFactor * 30, radians(30), 0, true); // arrow to end of year range slidder

  fill(340);
  textSize(scaleFactor * 16);
  textAlign(LEFT, BOTTOM);

  text("End of year range slider", graphPlotMidX + scaleFactor * 400, graphPlotY2 - (scaleFactor * 60));
  arrowLine(graphPlotMidX + scaleFactor * 400, graphPlotY2 + (scaleFactor * 50), graphPlotMidX + scaleFactor * 400, graphPlotY2 - (scaleFactor * 50), radians(30), 0, true); // arrow to end of year range slidder

  text("Start of year range slider", graphPlotMidX + scaleFactor * 100, graphPlotY2 - (scaleFactor * 60));
  arrowLine(graphPlotMidX + scaleFactor * 100, graphPlotY2 + (scaleFactor * 50), graphPlotMidX + scaleFactor * 100, graphPlotY2 - (scaleFactor * 50), radians(30), 0, true); // arrow to end of year range slidder



  //arrowLine(textEntryButtonPlotX1, resetButtonPlotY1 - scaleFactor * 10, textEntryButtonPlotX1 - scaleFactor * 60, resetButtonPlotY1 - scaleFactor * 90, radians(30), 0, true); //arrow to text entry
}

void drawOverviewMenu() {

  strokeWeight(int(scaleFactor * 10));//overview menu 
  stroke(0);
  fill(0, 0, 0, 95);
  rectMode(CORNERS);
  rect(overviewMenuPlotX1, overviewMenuPlotY1, overviewMenuPlotX2, overviewMenuPlotY2, (scaleFactor * 6));

  strokeWeight(int(scaleFactor * 5));// overview menu "back to menus button"
  stroke(0);
  fill(0, 0, 0, 95);
  rectMode(CORNERS);
  rect(overviewExitButtonPlotX1, overviewExitButtonPlotY1, overviewExitButtonPlotX2, overviewExitButtonPlotY2, (scaleFactor * 3));

  fill(340);
  textSize(scaleFactor * 20);
  textAlign(LEFT, TOP);
  text("Back to Menus", overviewExitButtonPlotX1 + textPlacementPadX, overviewExitButtonPlotY1 + textPlacementPadY + (scaleFactor * 3));
}

void drawMenuTabs() {


  if (timelineMenuChosen) {
    strokeWeight(int(scaleFactor * 4));// Filter graph tab CHOSEN
    stroke(340);
    fill(340, 80);
    rectMode(CORNERS);
    rect(menuTabLeft, menuTabTop, menuTabMid - (scaleFactor * 2), menuTabBottom, (scaleFactor * 3), (scaleFactor * 3), 0, 0);

    textAlign(LEFT, TOP);
    fill(100);
    text("Timeline", menuTabLeft + textPlacementPadX, menuTabTop + textPlacementPadY); //Text for CHOSEN filtergraph Tab

    strokeWeight(int(scaleFactor * 2));// Alt. graph tab
    stroke(90);
    fill(50, 60);
    rectMode(CORNERS);
    rect(menuTabMid + (scaleFactor * 5), menuTabTop, menuTabRight, menuTabBottom, (scaleFactor * 3), (scaleFactor * 3), 0, 0);

    textAlign(LEFT, TOP);
    fill(340, 80);
    text("Cluster Data", menuTabMid + textPlacementPadX, menuTabTop + textPlacementPadY); //Text for non chosen alternate graph
  }
  else if (comparisonGraphMenuChosen) {

    strokeWeight(int(scaleFactor * 2));// Filter graph tab
    stroke(300);
    fill(340, 60);
    rectMode(CORNERS);
    rect(menuTabLeft, menuTabTop, menuTabMid - (scaleFactor * 5), menuTabBottom, (scaleFactor * 3), (scaleFactor * 3), 0, 0); 

    textAlign(LEFT, TOP);
    fill(100, 80);
    text("Timeline", menuTabLeft + textPlacementPadX, menuTabTop + textPlacementPadY); //Text for non chosen filtergraph Tab//text for non chosen filter graph

    strokeWeight(int(scaleFactor * 4));// Alt. graph tab CHOSEN
    stroke(50);
    fill(50, 80);
    rectMode(CORNERS);
    rect(menuTabMid + (scaleFactor * 2), menuTabTop, menuTabRight, menuTabBottom, (scaleFactor * 3), (scaleFactor * 3), 0, 0);

    textAlign(LEFT, TOP);
    fill(340);
    text("Cluster Data", menuTabMid + textPlacementPadX, menuTabTop + textPlacementPadY); //Text for CHOSEN alternate graph Tab
  }
}

void drawOverviewButton() {

  strokeWeight(int(scaleFactor * 5));// Main menu box
  stroke(100);
  fill(0, 0, 0, 60);
  rectMode(CORNERS);
  rect(overviewButtonPlotX1, overviewButtonPlotY1, overviewButtonPlotX2, overviewButtonPlotY2, (scaleFactor * 3));

  textSize(16);
  textAlign(LEFT, TOP);
  fill(340);
  text("Overview Graph", overviewButtonPlotX1 + (scaleFactor * 10), overviewButtonPlotY1 + (scaleFactor * 2));
}

void resetSplatter() {
  splatterHasBeenChosen = false;
}

void chooseSplatter() {
  indexOfChosenSplatter = int(random(splatterArray.length));
  chosenSplatter = loadImage(splatterArray[indexOfChosenSplatter]);

  splatterHasBeenChosen = true;
}

void drawSplatter() {
  if (!splatterHasBeenChosen)
    chooseSplatter(); 

  if (splatterHasBeenChosen) {
    chosenSplatter.resize(int(width - (divisorLinePlotX + (scaleFactor * 2))), height);
    imageMode(CORNER);
    image(chosenSplatter, divisorLinePlotX + (scaleFactor * 2), 0);
  }
}



/*
 * Draw arrow heads at the ends of a line.
 */


/*
 * Draws a lines with arrows of the given angles at the ends.
 * x0 - starting x-coordinate of line
 * y0 - starting y-coordinate of line
 * x1 - ending x-coordinate of line
 * y1 - ending y-coordinate of line
 * startAngle - angle of arrow at start of line (in radians)
 * endAngle - angle of arrow at end of line (in radians)
 * solid - true for a solid arrow; false for an "open" arrow
 */
void arrowLine(float x0, float y0, float x1, float y1, 
float startAngle, float endAngle, boolean solid)
{
  line(x0, y0, x1, y1);
  if (startAngle != 0)
  {
    arrowhead(x0, y0, atan2(y1 - y0, x1 - x0), startAngle, solid);
  }
  if (endAngle != 0)
  {
    arrowhead(x1, y1, atan2(y0 - y1, x0 - x1), endAngle, solid);
  }
}

/*
 * Draws an arrow head at given location
 * x0 - arrow vertex x-coordinate
 * y0 - arrow vertex y-coordinate
 * lineAngle - angle of line leading to vertex (radians)
 * arrowAngle - angle between arrow and line (radians)
 * solid - true for a solid arrow, false for an "open" arrow
 */
void arrowhead(float x0, float y0, float lineAngle, 
float arrowAngle, boolean solid)
{
  float phi;
  float x2;
  float y2;
  float x3;
  float y3;
  final float SIZE = 8;

  x2 = x0 + SIZE * cos(lineAngle + arrowAngle);
  y2 = y0 + SIZE * sin(lineAngle + arrowAngle);
  x3 = x0 + SIZE * cos(lineAngle - arrowAngle);
  y3 = y0 + SIZE * sin(lineAngle - arrowAngle);
  if (solid)
  {
    triangle(x0, y0, x2, y2, x3, y3);
  }
  else
  {
    line(x0, y0, x2, y2);
    line(x0, y0, x3, y3);
  }
}

