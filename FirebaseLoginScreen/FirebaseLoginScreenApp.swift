//
//  FirebaseLoginScreenApp.swift
//  FirebaseLoginScreen
//
//  Created by Bhumika Patel on 01/07/22.
//

import SwiftUI
import Firebase

@main
struct FirebaseLoginScreenApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:  [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
