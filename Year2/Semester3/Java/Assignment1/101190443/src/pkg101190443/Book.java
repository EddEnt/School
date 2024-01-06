package pkg101190443;

public class Book {
        
    private int bookNumber, year;
    private String title, mainAuthor, genre;
    
    
    public Book (int bn, String title, String author, String genre, int year){
        //Book Constructor
        this.bookNumber = bn;
        this.title = title;
        this.mainAuthor = author;
        this.genre = genre;
        this.year = year;
        
    }
    
    public int getBookNum(){ //Returns the book number
        
       return bookNumber;
    }
    
    public String getTitle(){ //Returns the book title
        
        return title;
    }
    
    public String getAuthor(){ //Returns the book author
        return mainAuthor;
    }
    
    public String getGenre(){ //Returns the book genre
        return genre;
    }
    
    public String toString(){ //To string method to print all the book variables
        String s = "---Book---";
        s += "\nBook Number: " + bookNumber + "\nBook Title: " + title + "\nBook Author: " + mainAuthor
                + "\nBook Genre: " + genre + "\nYear of Publication: " + year;
        s += "\n----------";
        return s;
    }
}
