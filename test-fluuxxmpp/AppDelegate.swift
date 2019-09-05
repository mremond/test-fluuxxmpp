//
//  AppDelegate.swift
//  test-fluuxxmpp
//
//  Created by Mickaël Rémond on 04/09/2019.
//  Copyright © 2019 ProcessOne. All rights reserved.
//

import UIKit
import XMPP

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        guard let jid = JID("test@localhost/XMPPDemo") else { print("Invalid JID"); return true}
        var xmppConfig = Config(jid: jid, password: "test", useTLS: false)
        xmppConfig.allowInsecure = true
        xmppConfig.host = "mremond-mbp.local"
        xmppConfig.streamObserver = DefaultStreamObserver()

        let client = XMPP(config: xmppConfig)

        client.connect {
          print("Disconnected !")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

