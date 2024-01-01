//
//  SegementedBarView.swift
//  Taski
//
//  Created by Omar Bakri on 16/06/1445 AH.
//

import SwiftUI

struct SegementedBarView: View {
    
    @StateObject var taskModel: TaskViewModel = .init()
    let tabs = ["Today", "Upcoming" , "Task Done ✅"]
    
    @Namespace var animation
    
    var body: some View {
        HStack( spacing: 10) {
            ForEach(tabs , id: \.self){ tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                    .foregroundColor(taskModel.currentTab == tab ? . white : .black)
                    .padding(.vertical,6)
                    .frame(maxWidth: .infinity)
                    .background{
                        
                        if taskModel.currentTab == tab{
                            
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                            
                        }
                        
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{ taskModel.currentTab = tab}
                    }
            }
            
        }
    }
}


struct SegementedBarView_Previews: PreviewProvider {
    static var previews: some View {
        SegementedBarView()
    }
}
