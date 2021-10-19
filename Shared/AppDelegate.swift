//
//  AppDelegate.swift
//  EduwebParents
//
//  Created by user175092 on 7/9/21.
//

import Foundation
import UIKit
import OneSignal

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_application: UIApplication, didFinishLaunchingOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        //navigation bar appearance

        //OneSignal Debugging
        OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
        
        //OneSignal initialization
        OneSignal.initWithLaunchOptions(launchOptions)
        OneSignal.setAppId("b6987dd6-80c8-40da-83e0-3ada5d55876c")
        
        //promptNotifications permission
        OneSignal.promptForPushNotifications(userResponse: {accepted in
            print("User accepted notifications: \(accepted)")
        })
        
        return true
    }
}
