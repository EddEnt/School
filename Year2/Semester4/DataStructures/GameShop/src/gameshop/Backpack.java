
package gameshop;
// This class should implement a backpack as a linked list
    // The backpack can hold any number of weapons as long as maxWeight is not crossed.
    // If an attempt to add a weapon to backpack is rejected due to weight

/**
 *
 * @author Edward Entecott
 * 101190443
 * April 10th, 2020
 */

    class Backpack
    {
        double maxWeight;
        double presentWeight;
        Node head, tail;
    
        public class Node {
            String data;
            public Node next;
            public Node(String a){
                data = a;
                next = null;
            }
        }
        
        public class LinkedList{
        Node head;
    }
    
        public Backpack(){
            head = tail = null;
        }
        
        public void addTo(String k){
        Node n = new Node(k);
        if(head == null){
            head = n;
            return;
        }
        Node curr = head; //curr short for current
        while(curr.next != null){
            curr = curr.next;
        }
        curr.next = n;
    }
        
        public boolean lookIn(String key){ //Search through the Backpack
        Node curr = head;
        while (curr!=null && curr.data!=key){
            curr=curr.next;
        }
        if (curr==null){
            return false;
        }
        return true;
        }
        
        public String toString(){
        String s="Backpack Inventory:";
        Node curr=head;
        while (curr!=null){
            s=s+curr.data+" \n";
            curr=curr.next;
        }
        return s+"\n";
    }
        
    }
