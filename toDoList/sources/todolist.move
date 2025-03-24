
/// Module: todolist
module todolist::todolist;



// === Imports ===
use std::string::String;

// === Errors ===

// === Constants ===

// === Structs ===
public struct TodoItem has store ,drop {
  title: String,
  completed: bool,
}


public struct TodoList has key {
  id: UID,
  items: vector<TodoItem>,
}

// === Events ===

// === Method Aliases ===

// === Public Functions ===
public fun new(ctx: &mut TxContext) {
  let list = TodoList {
    id: object::new(ctx),
    items: vector::empty(),
  };
  transfer::share_object(list)
}

public fun add(list:&mut TodoList,item:String) {
  list.items.push_back(TodoItem {
    title: item,
    completed: false,
  });
}

public fun remove (list:&mut TodoList,index:u64) {
  list.items.remove(index);
}
public fun update_status(list:&mut TodoList,index:u64) {
  let item = list.items.borrow_mut(index);
  item.completed = true;
}

public fun delete(list:TodoList) {
  let TodoList {id,items: _} = list;
  id.delete();
}



// === View Functions ===

// === Admin Functions ===

// === Package Functions ===

// === Private Functions ===

// === Test Functions ===


