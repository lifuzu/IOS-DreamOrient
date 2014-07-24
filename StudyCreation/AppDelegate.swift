//
//  AppDelegate.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/16/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    var coreDataProvider: CoreDataProvider?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        //self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        //self.window!.backgroundColor = UIColor.whiteColor()
        //self.window!.makeKeyAndVisible()
        self.coreDataProvider = CoreDataProvider()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.saveContext()
    }

    // #pragma mark - Core Data stack
    
    func saveContext () {
        self.coreDataProvider!.saveContext()
    }
    
    var managedObjectContext: NSManagedObjectContext {
    return self.coreDataProvider!.managedObjectContext
    }
    
    var managedObjectModel: NSManagedObjectModel {
    return self.coreDataProvider!.managedObjectModel
    }
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
    return self.coreDataProvider!.persistentStoreCoordinator
    }

}

