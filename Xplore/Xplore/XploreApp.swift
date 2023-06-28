//
//  XploreApp.swift
//  Xplore
//
//  Created by Leander van Aarde on 2023/06/23.
//

import SwiftUI
import FirebaseCore
import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
//        return true
//    }
//}

@main
struct XploreApp: App {
    init() {
        FirebaseApp.configure()
    }
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainNavigation()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
