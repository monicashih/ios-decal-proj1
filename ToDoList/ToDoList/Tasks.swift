//
//  Tasks.swift
//  ToDoList
//
//  Created by Monica Shih on 10/11/15.
//  Copyright © 2015 Monica Shih. All rights reserved.
//

import UIKit

struct Tasks {
    var name: String
    var completed: Bool
    var timeCompleted: NSDate
    
    init(text: String) {
        self.name = text
        self.completed = false
        self.timeCompleted = NSDate()
        
    }
}
