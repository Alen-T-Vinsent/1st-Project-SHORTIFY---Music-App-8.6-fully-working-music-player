//
//  __6App.swift
//  8.6
//
//  Created by Apple  on 10/11/22.
//

import SwiftUI

@main
struct __6App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
