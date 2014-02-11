


char keyboardLayout[][] = {
  {
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
  }
  , {
    'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'
  }
  , {
    'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', '0'
  }
  , {
    'Z', 'X', 'C', 'V', 'B', 'N', 'M', ',', '.', '0'
  }
};

float[] keyboardButtonTops;
float[] keyboardButtonBottoms;
float[] keyboardButtonLefts;
float[] keyboardButtonRights;

float gwPlotX1, gwPlotX2;
float gwPlotY1, gwPlotY2;
float gwWidth, gwHeight;

// text filed cordinates
float textFieldX1, textFieldX2;
float textFieldY1, textFieldY2;

// onScreenKeyboard cordinates
float screenX1, screenX2;
float screenY1, screenY2;

// spacebar, enter and backSpace cordinates
float spacebarX1, spacebarY1, spacebarWidth, spacebarHeight;
float enterX1, enterY1, enterWidth, enterHeight;
float backSpaceX1, backSpaceY1, backSpaceWidth, backSpaceHeight;
float backButtonX1, backButtonY1, backButtonX2, backButtonY2;


String movieName = "";
String autoString = "";
int typedCount;
char movieNameChar[] = new char[300];

void keyboardSetup() {
  println("Entered kbd setup");
  // Graphical Window coordiantes
  gwPlotX1 = textEntryMenuPlotX1;
  gwPlotX2 = textEntryMenuPlotX2;
  gwPlotY1 = textEntryMenuPlotY1;
  gwPlotY2 = textEntryMenuPlotY2;
  gwWidth = gwPlotX2 - gwPlotX1;
  gwHeight = gwPlotY2 - gwPlotY1;

  textFieldX1 = textEntryMenuPlotX1 + scaleFactor * 290;
  textFieldY1 = textEntryMenuPlotY1 + scaleFactor * 110;
  textFieldX2 = textFieldX1 + scaleFactor * 400;
  textFieldY2 = textFieldY1 + scaleFactor * 40;


  // text area back button cordinates
  backButtonX1 = gwPlotX1 + 5 * scaleFactor;
  backButtonX2 = backButtonX1 + 30 * scaleFactor;
  backButtonY2 = gwPlotY2 - 5 * scaleFactor;
  backButtonY1 = backButtonY2 - 15 * scaleFactor;


  // onscreen keyboard cordinates
  screenX1 = backButtonX2 + 5 * scaleFactor;
  screenX2 = gwPlotX2 - 5 * scaleFactor;
  screenY2 = gwPlotY2 - 5 * scaleFactor;
  screenY1 = gwPlotY2 - 50 * scaleFactor;


  spacebarX1 = gwPlotX1 + (gwPlotX2-gwPlotX1)/2;
  spacebarY1 = gwPlotY2 - 10 * scaleFactor;
  spacebarWidth = 50 * scaleFactor;
  spacebarHeight = 4 * scaleFactor;

  backSpaceX1 = spacebarX1 + 60 * scaleFactor + 5 * scaleFactor;
  backSpaceY1 = gwPlotY2 - 10 * scaleFactor;
  backSpaceWidth = 10 * scaleFactor;
  backSpaceHeight = 4 * scaleFactor;

  enterX1 = gwPlotX1 + (165) * scaleFactor + 80 * scaleFactor;
  enterY1 = gwPlotY2 - 45 * scaleFactor + 12 * scaleFactor;
  enterHeight = 14 * scaleFactor;
  enterWidth =  14 * scaleFactor;

  keyboardButtonTops = new float[4];
  keyboardButtonBottoms = new float[4];
  keyboardButtonLefts = new float[10];
  keyboardButtonRights = new float[10];


  float tempTop = textEntryMenuPlotY2 + (scaleFactor * 170);
  float tempBottom = tempTop + (scaleFactor * 40);
  float tempLeft = textEntryMenuPlotX1 + scaleFactor * 250;
  float tempRight = tempLeft + (scaleFactor * 40);

  for ( int i = 0; i < 4; i++) {
    keyboardButtonTops[i] = tempTop;
    keyboardButtonBottoms[i] = keyboardButtonTops[i] + scaleFactor * 40;

    tempTop = keyboardButtonBottoms[i] + (scaleFactor * 10);
  }

  for (int j = 0; j < 10; j++) {

    keyboardButtonLefts[j] = tempLeft;
    keyboardButtonRights[j]= keyboardButtonLefts[j] + scaleFactor * 40;

    tempLeft = keyboardButtonRights[j] + (scaleFactor * 10);
  }


  spacebarX1 = keyboardButtonRights[4];
  spacebarY1 = keyboardButtonBottoms[3] + scaleFactor * 10;
  spacebarWidth = spacebarX1 + 200 * scaleFactor;
  spacebarHeight = spacebarY1 + 40 * scaleFactor;

  backSpaceX1 = keyboardButtonRights[9] + scaleFactor * 20;
  backSpaceY1 = keyboardButtonTops[0] - scaleFactor * 30;
  backSpaceWidth = backSpaceX1 + 80 * scaleFactor;
  backSpaceHeight = backSpaceY1 + 40 * scaleFactor;

  enterX1 = keyboardButtonRights[9] + scaleFactor * 20;
  enterY1 = keyboardButtonTops[2] - scaleFactor * 30;
  enterHeight = enterY1 + 40 * scaleFactor;
  enterWidth =  enterX1 + 80 * scaleFactor;
}





void plotKeyboardButtons() {
  println("Entered plot kbd buttons method.");
  typedCount = 0;
  //setting textField
  noStroke();
  fill(340, 99.999);
  rectMode(CORNERS);
  rect(textFieldX1, textFieldY1, textFieldX2, textFieldY2);
  fill(0);
  textSize(18*scaleFactor);
  textLeading(7*scaleFactor);
  textAlign(LEFT, CENTER);

  text("Enter region name : " + movieName + autoString, textFieldX1 + 10 * scaleFactor, textFieldY1 + (textFieldY2-textFieldY1)/2);




  for (int i = 0 ; i < 4 ; i++ ) {
    for (int j = 0 ; j < 10; j++) {
      if ((keyboardLayout[i][j] >= 'A' && keyboardLayout[i][j] <= 'Z') || keyboardLayout[i][j] == '.' || keyboardLayout[i][j] == ',' || (keyboardLayout[i][j] >= '0' && keyboardLayout[i][j] <='9')) {

        fill(0, 60);
        stroke(224, 43, 96);
        strokeWeight(5*scaleFactor);
        // rectMode(RADIUS);
        rect(keyboardButtonLefts[j], keyboardButtonTops[i], keyboardButtonRights[j], keyboardButtonBottoms[i], scaleFactor * 3);

        textSize(18* scaleFactor);
        textAlign(LEFT, TOP);
        fill(340);
        //text(keyboardLayout[i][j], gwPlotX1, gwPlotY2);
        text(keyboardLayout[i][j], keyboardButtonLefts[j] + textPlacementPadX, keyboardButtonTops[i] + textPlacementPadY + scaleFactor * 8);
      }
    }
  }

  fill(0, 60);
  stroke(224, 43, 96);
  strokeWeight(5*scaleFactor);
  rect(spacebarX1, spacebarY1, spacebarWidth, spacebarHeight);
  rect(enterX1, enterY1, enterWidth, enterHeight);
  rect(backSpaceX1, backSpaceY1, backSpaceWidth, backSpaceHeight);

  fill(340);
  text("Enter", enterX1 + textPlacementPadX, enterY1 + textPlacementPadY + scaleFactor * 8);
  text("Del", backSpaceX1 + textPlacementPadX, backSpaceY1 + textPlacementPadY + scaleFactor * 8);



  //  display possible region names
  if (autoString != "") {
    //    String[] rowNames = new String[100];
    //    rowNames = data.getRowNames();
    int count = 0;
    int countY = 0;
    for (int i=0; i<noOfMonsters; i++) {
      for (int j=0; j<MonsterID; j++) {
        if (movieName.length() == 0) {
        }
        else if ((KeywordListTitle[i].toUpperCase()).contains(movieName.toUpperCase()) && KeywordListMonster[i] == MonsterName[j]) {
          noFill();
          noStroke();
          fill(255);
          textSize(6 * scaleFactor);
          textAlign(LEFT, CENTER);

          if (gwPlotY1 +  (20 + countY * 10) * scaleFactor > gwPlotY2 - 70 * scaleFactor ) {
            count ++;
            countY = 0;
          }
          countY++ ;
          //count ++ ;
          if (count <= 10) {
            text(KeywordListTitle[i], gwPlotX1 +  90 * count * scaleFactor + 25, gwPlotY1 +  (20 + countY * 10) * scaleFactor);
          }
        }
      }
    }

    //    for (int i = 0; i<data.getRowCount() ; i++) {
    //      if (movieName.length() == 0) {
    //      }
    //      else if ((rowNames[i].toUpperCase()).startsWith(movieName.toUpperCase()) == true) {
    //        noFill();
    //        noStroke();
    //        fill(255);
    //        textSize(6 * scaleFactor);
    //        textAlign(LEFT, CENTER);
    //
    //        if (gwPlotY1 +  (20 + countY * 10) * scaleFactor > gwPlotY2 - 70 * scaleFactor ) {
    //          count ++;
    //          countY = 0;
    //        }
    //        countY++ ;
    //        //count ++ ;
    //        if (selectMap == true) {
    //          fill(0);
    //        }
    //        text(rowNames[i], gwPlotX1 +  90 * count * scaleFactor + 25, gwPlotY1 +  (20 + countY * 10) * scaleFactor);
    //      }
    //    }
  }
}


void updateMovieName(char tempKey, int var) {
  if (var == 1) {
    movieName = movieName + tempKey;
  }
//  else {
//    movieName = new String(movieNameChar, 0, (movieName.length() - 1));
//  }
}


void autoComplete () { 
  //  data = new ProcessTable("Total_Primary_Energy_Production.tsv");
  //  String[] rowNames = new String[100];
  //  rowNames = data.getRowNames();
  //  for (int i = 0; i<data.getRowCount() ; i++) {
  //    if (movieName.length() == 0) {
  //      autoString = "";
  //    }
  //    else if ((rowNames[i].toUpperCase()).startsWith(movieName.toUpperCase()) == true) {
  //      autoString = rowNames[i].substring(movieName.length());
  //    }
  //  }

  for (int i=0; i<noOfMonsters; i++) {
    for (int j=0; j<MonsterID; j++) {
      if (movieName.length() == 0) {
        autoString = "";
      }
      else if ((KeywordListTitle[i].toUpperCase()).contains(movieName.toUpperCase()) && KeywordListMonster[i] == MonsterName[j]) {
        autoString = KeywordListTitle[i].substring(movieName.length());
      }
    }
  }
}


void keyPressed() {
  if (textEntryMenuChosen) {
    if ((key >= 'a' && key <= 'z') || (key >= 'A' && key <= 'Z') || key == ' ' || key == ',' || key == '.' || (key >= '0' && key <= '9')) {
      movieNameChar[typedCount++] = key; 
      updateMovieName(movieNameChar[typedCount-1], 1);
      autoComplete();
    }
    if (key == BACKSPACE || key == DELETE) {
      if (typedCount > 0 ) {
        typedCount--;
        updateMovieName(key, 0);
        autoComplete();
      }
    }
    if (key == ENTER || key == RETURN) {
      movieName = movieName + autoString;
      //print ln(movieName);
      // selectedRegions[regionCount++] = movieName;
      movieName = "";
      autoString = "";
      println(movieName);
    }
  }
}

