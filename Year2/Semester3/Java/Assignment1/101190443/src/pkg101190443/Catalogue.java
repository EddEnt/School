package pkg101190443;

public class Catalogue {
    
    private static int currentUnusedBookNo;
    private int maxBooks, numBooks;
    public Book[] bookLi;
    
    //Constructor of the catalogue system
    public Catalogue(int bookNoSeed, int maxBooks){
        this.currentUnusedBookNo = bookNoSeed;
        this.numBooks = 0;
        this.maxBooks = maxBooks;
        bookLi = new Book[maxBooks];
        
    }
    
    //Method for adding books into the system
    public boolean addBook(String title, String mainAuthor, String genre, int year){
        if(numBooks < maxBooks){
            bookLi[numBooks] = new Book(currentUnusedBookNo, title, mainAuthor, genre, year);
            numBooks++;
            currentUnusedBookNo++;
            return true;
        }
        return false;
    }
    
    //Will loop through the array, and find a book through its book number, assigned to it at the time of entry into the array
    private int findBook(int bNum){ 
        for (int i = 0; i < numBooks; i++){
            if(bookLi[i].getBookNum() == bNum){
                return i;
            }
        }
        return -1;
    }
    
      //Will print out the book when its book number is entered
    public String viewBook(int bNum){
        int find = this.findBook(bNum);
        if (this.findBook(bNum) != -1){
            return bookLi[find].toString();
        }
        return null;
    }
    
    //Will delete the specified book with the books assigned number, error with shortening the array
    public boolean deleteBook(int bNum){
        int find = this.findBook(bNum);
        if(find != -1){
            bookLi[find] = bookLi[numBooks-1];
            currentUnusedBookNo--;
            return true;
            }
        return false;
    }
    
    //Will display all books stored in the array
    public String getBookList(){
        String s = "-----------";
        s += "\nNumber of Books: " + numBooks + "\nMax Books: " + maxBooks;
        for(int i=0; i<numBooks; i++) {
            s += bookLi[i].toString();
        }
        return s;
    }
    
}
