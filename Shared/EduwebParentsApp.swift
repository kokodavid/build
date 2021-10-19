//
//  EduwebParentsApp.swift
//  Shared
//
//  Created by Arthur on 21/06/2021.
//

import SwiftUI
import OneSignal

@main
struct EduwebParentsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var authenticaton = Authentication()
    
    var body: some Scene {
        WindowGroup {
            if authenticaton.isValidated{
            ContentView()
                .environmentObject(authenticaton)
            }else{
                LoginView()
                    .environmentObject(authenticaton)
                
            }
        }
    }
}
