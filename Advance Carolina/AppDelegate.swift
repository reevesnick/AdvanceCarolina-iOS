//
//  AppDelegate.swift
//  Advance Carolina
//
//  Created by Neegbeah Reeves on 3/7/16.
//  Copyright © 2016 Brown Box Works. All rights reserved.
//

import UIKit
import CoreData
import Batch
import Parse
import LaunchKit
import ChameleonFramework


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

        

        
        // Initialize LaunchKit
        LaunchKit.launchWithToken("PbQhmGwg52ntajnadBt2CrNrZa6tZkMIMo6DSuH57qi-")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let hasShownOnboarding = defaults.boolForKey("shownOnboardingBefore")
        if !hasShownOnboarding {
            let lk = LaunchKit.sharedInstance()
            lk.presentOnboardingUIOnWindow(self.window!) { _ in
                print("Showed onboarding!")
                defaults.setBool(true, forKey: "shownOnboardingBefore")
            }
        }

        //Custon UI
        Chameleon.setGlobalThemeUsingPrimaryColor(UIColor.flatYellowColor(), withContentStyle: UIContentStyle.Contrast)
        
       // UIColor(contrastingBlackOrWhiteColorOn:UIColor!, isFlat:Bool)

        
        
        //Parse Server API Key
        let configuration = ParseClientConfiguration {
            $0.applicationId = "Lvkh2vw9sSKCLk1R8SfKKlUZGUSFoEbMaLr0Fogf"
            $0.clientKey = "VqzatKxu4742ZATP9mdgRSo7awrxLoBV8wBftgMw"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initializeWithConfiguration(configuration)

        //Show Registration
        let registrationDefaults = NSUserDefaults.standardUserDefaults()
        let registrationShowFirstTime = registrationDefaults.boolForKey("showRegistrationFirstTime")
        if !registrationShowFirstTime{
           // var storyboard = UIStoryboard(name: "RegisterVoterInfo", bundle: nil)
            //var initialViewController = storyboard.instantiateViewControllerWithIdentifier("RegisterVoterInfo") as! UIViewController
            
            //self.window?.rootViewController = initialViewController
            //self.window?.makeKeyAndVisible()

        }
        
        //Push Notifications - Batch
        //Batch.startWithAPIKey("DEV56F29C2F5520F6FE495D960485E"); //Developer Key
        Batch.startWithAPIKey("56F29C2F53E59355215F7DB2616C2A") //Live Key
        
        BatchPush.registerForRemoteNotifications()
        
        // Local Notifications
            if #available(iOS 8.0, *) {
                let notificationType = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
                UIApplication.sharedApplication().registerUserNotificationSettings(notificationType)

            } else {
                // Fallback on earlier versions
            }
                //UIApplication.sharedApplication().registerUserNotificationSettings(notificationType)
        

            // Fallback on earlier versions
        
       // var appFont:UIFont = UIFont(name: "Avenir", size: 20)!

        
        
        return true
    
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        // Dismiss push notification
        BatchPush.dismissNotifications()
        
    
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Local Push Notification
    

    
    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.app.Advance_Carolina" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("Advance_Carolina", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

