//
//  ViewController.swift
//  ToDoList
//
//  Created by Monica Shih on 10/11/15.
//  Copyright © 2015 Monica Shih. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tasksList = [Tasks]()
    
    @IBOutlet var tasksTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let task = tasksList[indexPath.row] as Tasks
        cell.textLabel!.text = task.name
        
        if task.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var task = tasksList[indexPath.row] as Tasks
        task.completed = !task.completed
        if task.completed == true {
            task.timeCompleted = NSDate()
        }
        
        tasksList[indexPath.row] = task
        
        tasksTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tasksList.removeAtIndex(indexPath.row)
            tasksTable.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksList.count
    }
    
    @IBAction func unwindAddToList(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddTaskViewController
        let tasks = source.tasks as Tasks!

        if tasks != nil {
            self.tasksList.append(tasks)
            tasksTable.reloadData()
        }
    }
    
    
    @IBAction func unwindDoNothing(segue: UIStoryboardSegue) {
        return
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        expiredTasks()
    
        if segue.identifier == "Stats" {
            let nav = segue.destinationViewController as! UINavigationController
            let dest = nav.topViewController as! StatsViewController
            dest.tasksList = tasksList
        }
    }
    
    func expiredTasks() {
        for (var i = 0; i < tasksList.count; i++) {
            if (tasksList[i].completed) {
                let currentTime = NSDate()
                if (currentTime.timeIntervalSinceDate(tasksList[i].timeCompleted) > 86400) {
                    tasksList.removeAtIndex(i)
                }
            }
        }
        tasksTable.reloadData()
    }
    
}

