//
//  ContentView.swift
//  Taski
//
//  Created by Omar Bakri on 16/06/1445 AH.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationBarTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
