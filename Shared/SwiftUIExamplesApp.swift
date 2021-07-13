//
//  SwiftUIExamplesApp.swift
//  Shared
//
//  Created by niccari on 2021/07/11.
//

import SwiftUI
import GoogleMaps

@main
struct SwiftUIExamplesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            Navigator()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("api_key")
        return true
    }
}
