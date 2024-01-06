package pkg101190443;
import java.util.*;

public class Main {

    public static void main(String[] args) {

        Scanner input = new Scanner (System.in);
        int choice, bNum, year, search;
        String title, mainAuthor, genre;
        String a = "Please make a selection from the options below.\n"
                + " 1. Add Book\n 2. Delete Book\n 3. View All Books\n"
                + " 4. View Book Details\n 5. Exit";
        
        Catalogue b = new Catalogue(0, 100);
        
        System.out.println("\nWelcome to the Casual Writers Book Club\n");
        System.out.println(a);
        choice = input.nextInt();
        
        while (choice != 5){
            
            if(choice == 1){
                System.out.println("\nPlease enter the books details\n");
                input.nextLine();  //nextLine() is to clear the line for the Title entry, otherwise it will skip the title input and jump to Author
                System.out.println("Please enter the book title: ");
                title = input.nextLine();
                System.out.println("Please enter the books author: ");
                mainAuthor = input.nextLine();
                System.out.println("Please enter the books genre: ");
                genre = input.nextLine();
                System.out.println("Please enter the year of publication: ");
                year = input.nextInt();
                b.addBook(title, mainAuthor, genre, year);
            }
            
            //Delete selection
            if(choice == 2){
                System.out.println("Please enter the book number of the book to delete: ");
                bNum = input.nextInt();
                b.deleteBook(bNum);
                System.out.println("Book deleted.");
                
            }
            
            //Views all the books that have been entered into the array
            if(choice == 3){
               System.out.println(b.getBookList());               
            }
            
            //User input the books number, will search through the array, and find the book details associated with the number if valid
            if (choice == 4){
               System.out.println("Please enter the book number of the desired book: ");
               input.next();
               search = input.nextInt();
               b.viewBook(search);
               System.out.println(b.viewBook(search));
               //System hangs after the user enters the book number, forcing the user to input the same number again, which then returns the book 
               //information that the user is looking for
               
               if(b.viewBook(search) == null){
                   System.out.println("Book not found. Please try again.\n");
               } 
            }
            if (choice > 5 || choice < 1){
                System.out.println("INVALID SELECTION! PLEASE MAKE A VALID MENU SELECTION!\n");
            }
            System.out.println(a);
            choice = input.nextInt();
           
        }
        System.out.println("Thank you for using The Casual Writers Book Club catalogue. \nThe system will now exit.");
       
        
    }
    
}
