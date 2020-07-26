//
//  ToDoItem.swift
//  TodoListApp
//
//  Created by Artsiom Sakratar on 2/17/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import Foundation

class ToDoItem {
    var Title: String
    var IsCompleted: Bool
    
    init(Title: String) {
        self.Title = Title
        self.IsCompleted = false
    }
    
    public class func getDefaultData() -> [ToDoItem] {
        return []
    }
}
