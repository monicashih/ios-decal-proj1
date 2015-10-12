//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Monica Shih on 10/11/15.
//  Copyright © 2015 Monica Shih. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var tasks : Tasks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender !== doneButton {
            return
        }
        tasks = Tasks(text: textField.text!)
    }
    
}
