//
//  TaskTypeView .swift
//  Taski
//
//  Created by Omar Bakri on 19/06/1445 AH.
//

import SwiftUI

struct TaskTypeView: View {
    
    @EnvironmentObject var taskModel: TaskViewModel
    @Namespace var animation
    
    var body: some View {
        let taskTypes: [String] = ["Basic" , "Urgent" , "Important"]
        VStack(alignment: .leading, spacing: 12){
            Text("Task Type ")
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack(spacing: 12){
                
                ForEach(taskTypes , id: \.self) { type in
                    
                    Text(type)
                        .font(.callout)
                        .padding(.vertical,8)
                        .foregroundColor(taskModel.taskType == type ? .white : .black)
                        .frame(maxWidth: .infinity)
                        .background{
                            
                            if taskModel.taskType == type {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "TYPE", in: animation)
                            }else{
                                
                                Capsule()
                                    .strokeBorder(.black)
                                
                            }
                                 
                        }
                        .contentShape(Capsule())
                        .onTapGesture {
                            withAnimation{ taskModel.taskType = type
                                
                            }
                        }
                    
                    
                }
            }
            
                
            .frame(maxWidth: .infinity)
            .padding(.top , 10)

        }
        .padding(.vertical,10)
        
    }
}

struct TaskTypeView__Previews: PreviewProvider {
    static var previews: some View {
        TaskTypeView()
            .environmentObject(TaskViewModel())
            
    }
}
