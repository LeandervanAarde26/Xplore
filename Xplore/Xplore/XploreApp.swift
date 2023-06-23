//
//  XploreApp.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import SwiftUI

@main
struct XploreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
