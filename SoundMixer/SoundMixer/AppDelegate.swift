//
//  AppDelegate.swift
//  SoundMixer
//
//  Created by 利穂 虹希 on 2018/02/13.
//  Copyright © 2018年 EdTechTokushima. All rights reserved.
//

import UIKit
import MediaPlayer
let userDefaults = UserDefaults.standard

var player = AudioEnginePlayer()
var player2 = AudioEnginePlayer()
var player3 = AudioEnginePlayer()

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  /*
  var UserName: String?
  var userID: Int?
  var playingSong:MPMediaItem?
  */
  var Playlists:MPMediaItemCollection?
  //var title:String?
  var user = User()
  var users = [User]()
  //var init_users: [User] = []
  var userNum: Int = 0
  var allUserNum: Int = 0
  var rowNum: Int = 0
  var loadFlag: Bool = false
  var showFlag: Bool = false
  private var nc: UINavigationController?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    // Override point for customization after application launch.
    setNabivigationBar()
    
    var user = User()
    var i:Int = 0, j:Int = 0
    if userDefaults.object(forKey: "userNumber") != nil {
      userNum = userDefaults.integer(forKey: "userNumber")
      while(true) {
        if userDefaults.object(forKey: String(j)) != nil {
          var dic = userDefaults.dictionary(forKey: String(j))
          users.append(User())
          user.Id = dic!["ID"] as! Int
          user.Name = dic!["Name"] as! String
          users[i].Id = user.Id
          users[i].Name = user.Name
          i = i + 1
          print(i)
        }
        j = j + 1
        if i == userNum {
          break
        }
      }
    }
    if userDefaults.object(forKey: "allUserNum") != nil {
      allUserNum = userDefaults.integer(forKey: "allUserNum")
    }
    return true
  }
    
  func setNabivigationBar()
  {
    //デバッグの時ここで始めたいビューを指定できる
    let FirstViewController = UserViewController()
    nc = UINavigationController(rootViewController: FirstViewController)
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = nc

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

