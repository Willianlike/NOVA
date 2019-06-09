//
//  AppDelegate.swift
//  Nova
//
//  Created by Вильян Яумбаев on 08/06/2019.
//  Copyright © 2019 Вильян Яумбаев. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadJSON()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootVC()

        ArcticInfoRetriever.retrieve { (success, info: ArcticInfo?) in
            if let temp = info?.temperature {
                print("Arctic temperature: \(temp)")
                arcticTemp.value = temp
            } else {
                print("Arctic temperature fail")
            }
        }

        
        return true
    }
    
    func rootVC() -> UIViewController {
        var vcs = [UIViewController]()
        
        
        let vc1 = GameVC()
        vcs.append(NavigationVC(rootViewController: vc1))
        
        
        let vc2 = ToolsVC()
        vcs.append(NavigationVC(rootViewController: vc2))
        
        let vc3 = KnowledgeVC()
        vcs.append(NavigationVC(rootViewController: vc3))
        
        
        let vc4 = ScrollVC()
        vc4.image.image = UIImage(named: "settingsScreen")
        vc4.tabBarItem = SettingsVC.tabItem
        vcs.append(NavigationVC(rootViewController: vc4))
        
        
        return TabBarController(vcs: vcs)
    }
    
    func loadJSON() {
        let urlStr = "https://raw.githubusercontent.com/Willianlike/NOVA/master/my.json"
        
        guard let url = URL(string: urlStr) else { return }
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                guard response.result.isSuccess,
                    let data = response.result.value else {
                        print("Refresh config error \(String(describing: response.result.error))")
                        return
                }
                let json = JSON(data)
                if let knowledge = try? json["knowledge"].arrayValue.map({ try KnowledgeModel(json: $0) }) {
                    knowledgeVal.value = knowledge
                }
                if let tools = try? json["tools"].arrayValue.map({ try ToolModel(json: $0) }) {
                    toolsVal.value = tools
                }
                if var episodes = try? json["episodes"].arrayValue.map({ try EpisodeModel(json: $0) }).map({ GameStepModel(episode: $0)}) {
                    if episodes.count > 0 {
//                        episodes[0].episode.passed = true
                    }
                    episodesVal.value = episodes
                }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

