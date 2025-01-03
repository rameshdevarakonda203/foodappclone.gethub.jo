package com.foodAppClone.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	
	private Map<Integer,CartItem> items;
	
	
	public Cart() {
		this.items= new HashMap<>();
		
	}
	public void addItem(CartItem item) {
		
		int itemid= item.getMenu_id();
		
		if(items.containsKey(itemid)) {
			
			 CartItem existingItem = items.get(itemid);
			 existingItem.setQuantity(existingItem.getQuantity()+item.getQuantity());
		}
		else {
			
			items.put(itemid, item);
		}
	}
	
	public void UpdateItem(int Menu_id,int Quantity) {
		
		if(items.containsKey(Menu_id)) {
			
			if(Quantity <=0) {
				items.remove(Menu_id);
				
			}
			
			else {
				CartItem existingItem = items.get(Menu_id);
				existingItem.setQuantity(Quantity);
			
//          	items.get(Menu_id).setQuantity(Quantity);
			}
			
		}
		
	}
	
	public void removeItem(int  Menu_id) {
		
		items.remove(Menu_id);
		
	}
	
	public Map<Integer,CartItem> getItems(){
		return items;
		
	}
	
	public void  clear() {
		items.clear();
	}
	
	

}
