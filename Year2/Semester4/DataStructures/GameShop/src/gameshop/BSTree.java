package gameshop;

/**
 *
 * @author Edward Entecott
 * 101190443
 * April 10th, 2020
 */

public class BSTree {
    
    private BSTNode root;
    
    public BSTree(){
        root = null;
    }
    
    public void insert(Weapon item,String key){
        BSTNode newNode = new BSTNode(key);
        if(root == null){
            root = newNode;
            return;
        }
        BSTNode parent, current;
        current = parent = root;
        while(current != null){
            parent = current;
            if(current.find == key){
                current = current.left;
            }
            else{
                current = current.right;
            }
        }
        if(parent.find != key){
                parent.left = newNode;
            }
            else{
                parent.right = newNode;
            }
       
    }
    
    static int binarySearch(String[] arr, String x) 
    { 
        int l = 0, r = arr.length - 1; 
        while (l <= r) { 
            int m = l + (r - l) / 2; 
  
            int res = x.compareTo(arr[m]); 
  
            // Check if x is present at mid 
            if (res == 0) 
                return m; 
  
            // If x greater, ignore left half 
            if (res > 0) 
                l = m + 1; 
  
            // If x is smaller, ignore right half 
            else
                r = m - 1; 
        } 
  
        return -1; 
    }
    
    
    public boolean search (String key){
        if(root == null){
            return false;
        }
        BSTNode curr = root;
        while(curr != null && curr.find != key){
            if(curr.find != key){
                curr = curr.left;
            }
            else{
                curr = curr.right;
            }
        }
        if(curr == null){
            return false;
        }
        return true;
        
    }
    
    
    
        public void inOrderTrav(){
        System.out.print("In Order Traversal:");
        recInOrder(root);
        System.out.println("");
    }
    
    public void recInOrder(BSTNode curr){
        if (curr!=null){
            recInOrder(curr.left);
            System.out.print(" "+curr.find);
            recInOrder(curr.right); 
        }
    }
    
}
