//
//  ColorView.swift
//  Taski
//
//  Created by Omar Bakri on 19/06/1445 AH.
//

import SwiftUI

struct ColorView: View {
    @EnvironmentObject var taskModel: TaskViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Task Color")
                .font(.caption)
                .foregroundColor(.gray)
            
            //MARK: - Card Colors
            
            let colors: [String] = ["Yellow" , "Green" , "Blue" , "Purple" ,"Red" , "Orange"]
            
            HStack(spacing: 15) {
                ForEach(colors , id: \.self) { color in
                    Circle()
                        .fill(Color(color))
                        .frame(width: 25, height: 25)
                        .background{
                            
                            if taskModel.taskColor == color {
                                Circle()
                                    .strokeBorder(.gray)
                                    .padding(-3)
                                
                            }
                            
                        }
                        .contentShape(Circle())
                        .onTapGesture {
                            taskModel.taskColor = color
                        }
                }
            }
            
            .padding(.top , 10)

            
        }
        .frame(maxWidth: .infinity , alignment:  . leading)
        .padding(.top , 30)
        
        Divider()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
            .environmentObject(TaskViewModel())
            .fixedSize()
    }
}
