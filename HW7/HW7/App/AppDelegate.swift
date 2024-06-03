//
//  AppDelegate.swift
//  HW7
//
//  Created by Александр Федоткин on 02.06.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var backgroundCompletion: (() -> Void)?

    func application(_ application: UIApplication,
                     handleEventsForBackgroundURLSession identifier: String,
                     completionHandler: @escaping () -> Void) {
        backgroundCompletion = completionHandler
    }


}

