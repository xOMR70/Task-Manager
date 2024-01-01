//
//  AddNewTaskView .swift
//  Taski
//
//  Created by Omar Bakri on 19/06/1445 AH.
//

import SwiftUI

struct AddNewTaskView: View {
    @EnvironmentObject var taskModel: TaskViewModel
    //MARK: - All environment values in one variable
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View {
        VStack(spacing: 12){
            
            // Headline
            Text("Edit Task")
                .font(.title3.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }

                }
            
            
           // Color Types
            
            ColorView()
                .padding(.vertical , 10)
            
            
            // Deadline
            VStack(alignment: .leading, spacing: 12){
                Text("Task Deadline")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(taskModel.taskDeadline.formatted(date: .abbreviated , time: .omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top , 8)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            // Overlay Calendar
            .overlay(alignment: .bottomTrailing) {
                Button {
                    
                    taskModel.showDatePicker.toggle()
                    
                } label: {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                }

            }
            Divider()
            
             // Title Task
            VStack(alignment: .leading, spacing: 12){
                Text("Task Title")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $taskModel.taskTitle)
                
                    
                .frame(maxWidth: .infinity)
                .padding(.top , 10)

            }
            
            .padding(.top,10)
            Divider()
            
            
            // Job Task
            VStack(alignment: .leading, spacing: 12){
                Text("Task Job")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $taskModel.taskJob)
                
                    
                .frame(maxWidth: .infinity)
                .padding(.top , 10)

            }
            .padding(.top,10)
            Divider()
            
            // Task Types
            
            TaskTypeView()


            // Save Button
            
            Button {
                
                // If Success closing view 
                
                if  taskModel.addTask(context: env.managedObjectContext){
                    env.dismiss()
                }
                
            } label: {
                Text("Save Task")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
                
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 10)
            .disabled(taskModel.taskJob == "")
            .opacity(taskModel.taskJob == "" ? 0.6 : 1)

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
        //Overlay for Show date picker
        .overlay{
            
            ZStack{
                
                if taskModel.showDatePicker {
                    
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            taskModel.showDatePicker = false
                        }
                    
                    
                    //MARK: - Disabling past dates

                    DatePicker.init("", selection: $taskModel.taskDeadline , in: Date.now ... Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white , in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                        .padding()
                    
                    
                }
                
            }
        }
        .animation(.easeInOut, value: taskModel.showDatePicker)
        
        
        
    }
}

struct AddNewTaskView__Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
            .environmentObject(TaskViewModel())
    }
}
