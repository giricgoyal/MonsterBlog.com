/* 
   CS 424 f12 Proj2 
   Author: Chihua Ma
*/

//int YearStart = 1890, YearEnd = 2012;

// read genreFIle.tsv
String[] GenreList;
int Genres;
int currentGenre = 0;

int GenreListRows;
String[] GenreListTitle;
String[] GenreListGenre;


void readGenre() {
  
  GenreList = loadStrings("genreFile.tsv");
  Genres = GenreList.length;
  println("Genres # : "+Genres);
  
  String[] rows = loadStrings("parsedGenreList.tsv");
  GenreListRows = rows.length;
  
  GenreListTitle = new String[GenreListRows];
  GenreListGenre = new String[GenreListRows];
  
  for (int i=0; i<GenreListRows; i++) {
    String[] columns = split(rows[i], TAB);  // split the row on the tabs
    
    GenreListTitle[i] = columns[0];
    GenreListGenre[i] = columns[1];
  } // end - for
}
