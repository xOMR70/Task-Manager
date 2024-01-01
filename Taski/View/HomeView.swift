//
//  HomeView.swift
//  Taski
//
//  Created by Omar Bakri on 16/06/1445 AH.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskModel = TaskViewModel()

    
    //MARK: - Environment variabled in one value

    @Environment(\.self) var env
    
    //MARK: - Fetching Task
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)], predicate: nil, animation: .easeInOut) var tasks: FetchedResults<Task>


    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                
                //MARK: - Title

                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome Back 👋🏻")
                        .font(.callout)
                    Text("Here's Update Today.")
                        .font(.title3.bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                
                //MARK: - Segmented Bar
                
                SegementedBarView()
                    .padding(.top , 5)
                
                //MARK: - Task View

                TaskView()

                
                
            }
            .padding(5)
        }
        //MARK: - Overlay for add task
        .overlay(alignment: .bottom) {
            
            Button {
                taskModel.openEditTask.toggle()
                
            } label: {
                Label {
                    Text("Add Task")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                } icon: {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundColor(.white)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(.black , in:Capsule())
            }
            
            
            //MARK: - Linear Gradient BG
            .padding(.top,10)
            .frame(maxWidth: .infinity)
            .background(LinearGradient(colors: [.white.opacity(0.05),
                                                .white.opacity(0.04),
                                                .white.opacity(0.07),
                                                .white], startPoint: .top, endPoint: .bottom))


            
        }
        .fullScreenCover(isPresented: $taskModel.openEditTask) {
            taskModel.resetTaskData()
        } content: {
            
            AddNewTaskView()
                .environmentObject(taskModel)
        }
        
    }
    
    //MARK: - TaskView
    
    @ViewBuilder
    func TaskView() -> some View {
        
        LazyVStack(spacing: 20) {
            
            ForEach(tasks){ task in
                
                TaskRow(task: task)
                
            }
        }
        .padding(.top,20)
    }
    
    //MARK: - TaskRow

    @ViewBuilder
    
    func TaskRow(task:Task) -> some View {
        VStack(alignment: .leading, spacing: 10){
            
            
            //Type
            HStack {
                Text(task.type ?? "")
                    .font(.callout)
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background{
                        Capsule()
                            .fill(.white.opacity(0.3))
                    }
                
                Spacer()
                
                //MARK: - Edit Button Only For Non Completed Tasks

                
                if !task.isCompleted {
                    
                    Button {
                      
                    } label: {
                        
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }

                    
                }
                
            }
            
            
            Text(task.title ?? "")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.vertical)
            
            Text(task.job ?? "")
                .font(.subheadline.bold())
                .foregroundColor(.black)
                .padding(.vertical,10)
            
            
            HStack(alignment: .bottom, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Label {
                        Text((task.deadline ?? Date()).formatted(date: .long, time: .omitted))
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    .font(.caption)
                    
                    Label {
                        Text((task.deadline ?? Date()).formatted(date: .omitted, time: .shortened))
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .font(.caption)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                if !task.isCompleted {
                    Button {
                        // MARK: Updating Core Data here
                     
                        
                    } label: {
                        Circle()
                            .strokeBorder(.black,lineWidth: 1.5)
                            .frame(width: 25, height: 25)
                            .contentShape(Circle())
                    }
                }
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12 , style: .continuous)
                .fill(Color(task.color ?? "Yellow" ))
        }
        
    }

    
    
}





struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
