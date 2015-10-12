//
//  StatsViewController.swift
//  ToDoList
//
//  Created by Monica Shih on 10/11/15.
//  Copyright © 2015 Monica Shih. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var done: UILabel!
    var tasksList: [Tasks]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        done.text = numCompleted()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numCompleted() -> String {
        var num = 0
        for tasks in tasksList! {
            if tasks.completed {
                num+=1
            }
        }
        return String(num)
    }
    
    
}
