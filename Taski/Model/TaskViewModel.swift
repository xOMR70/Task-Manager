//
//  TaskViewModel.swift
//  Taski
//
//  Created by Omar Bakri on 16/06/1445 AH.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    
    @Published var currentTab : String = "Today"
    
    //MARK: - New Task Properties
    
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskJob: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool  = false
    
    
   

    
    //MARK: - Add task to core data ..
    
    func addTask(context: NSManagedObjectContext) -> Bool  {
        
       

        
        let task = Task(context:  context)
        
        task.title = taskTitle
        task.job = taskJob
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false 
        
        if let _ = try?  context.save() {
            
            return true
        }
        
        return false 
        
        
    }


    
    //MARK: - Reseting Data
    
    func resetTaskData(){
        
        taskTitle = ""
        taskJob = ""
        taskType = "Basic"
        taskColor = "Yellow"
        taskDeadline = Date()
        
        

    }
    
    
    
}
