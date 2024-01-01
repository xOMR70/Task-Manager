//
//  TaskiApp.swift
//  Taski
//
//  Created by Omar Bakri on 16/06/1445 AH.
//

import SwiftUI

@main
struct TaskiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
