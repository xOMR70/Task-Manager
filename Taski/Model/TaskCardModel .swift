//
//  TaskCardModel .swift
//  Taski
//
//  Created by Omar Bakri on 19/06/1445 AH.
//

import Foundation


struct taskCard: Identifiable {
    
    let id: String
    var taskTitle: String
    var taskJob: String
    var taskColor: String
    var taskDeadline: Date
    var taskType: String
    var showDatePicker: Bool
    
}
