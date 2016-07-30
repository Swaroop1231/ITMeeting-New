//
//  AppDelegate.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import UIKit
import CoreData
import EventKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let eventStore = EKEventStore()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        // Override point for customization after application launch.
        
        
        
        eventStore.requestAccessToEntityType(EKEntityType.Reminder, completion:
            {(granted, error) in
                if !granted
                {
                    print("Access to store not granted")
                    print(error!.localizedDescription)
                }
                else 
                {
                    print("Access granted")
                }
        })
        if (NSUserDefaults.standardUserDefaults().objectForKey("onoroff") == nil)
        {
           // NSUserDefaults.standardUserDefaults().setBool(true, forKey: "onoroff")
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "onoroff")
            saveCompanyDetails()
        }
        else
        {
            

        }

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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    
    
    func saveCompanyDetails() -> Void
    {
        
              
        var company1 = [String:String]()
        company1["name"] = "CAP Tulsa"
        company1["meetingDesc"] = "The major purpose of this meeting is to discuss about latest versions of Android OS and its new features.There would be power point presentation on connectivity between android device and watch."
        company1["date"] = "11-08-2016"
        company1["time"] = "11:15 AM"
        company1["offeringintern"] = "YES"
        company1["website"] = "captulsa.org/careers/"
        company1["location"] = " 1504 Eureka Rd #325, Roseville, CA "
        company1["id"] = "0"


        var company2 = [String:String]()
        company2["name"] = "SAP - SAP.com"
        company2["meetingDesc"] = " A meeting on  solutions like S/4 HANA, Cloud 4 Customer, Hybris, Mobile and IoT are the essential enablers of this shift. Against this backdrop we created Mastering Customer Engagement with SAP Solutions.The world is changing. Customers are more demanding. Customer loyalty is decreasing. And the pressure is on for share of customer – attracting them, keeping them, seducing them."
        company2["date"] = "11-09-2016"
        company2["time"] = "03:30 PM"
        company2["offeringintern"] = "NO"
        company2["website"] = "https://www.sap.com/careers/"
        company2["location"] = "1999 Avenue of the Stars,Los Angeles, CA "
        company2["id"] = "1"

        
        
        var company3 = [String:String]()
        company3["name"] = "Factual"
        company3["meetingDesc"] = "Our mission is to make the technology community better, more diverse, and more human; in short, we just want to make things better. JSConf does not focus on what is popular or cool now, but on topics that define and revolutionize the following year of technology. We have been the launching point for some of the most revolutionary products, services, and technologies on the web. We have also been the inspiration point and support base for a wide range of conferences beyond the JSConf name. Those awesome events are featured below, if you are near one, we strongly suggest you attend them!"
        company3["date"] = "11-10-2016"
        company3["time"] = "03:30 PM"
        company3["offeringintern"] = "YES"
        company3["website"] = "https://www.factual.com/jobs#problems"
        company3["location"] = "111 W Illinois St. 5th Floor,Chicago"
        company3["id"] = "2"
        
        
        var company4 = [String:String]()
        company4["name"] = "Inktank"
        company4["meetingDesc"] = "The IoT Tech Expo Event will bring together key industries from across America for two days of top level content and discussion. Industries include Manufacturing, Transport, Health, Logistics, Government, Energy and Automotive. Introducing and exploring the latest innovations within the Internet of Things, this conference is not to be missed."
        company4["date"] = "11-11-2016"
        company4["time"] = "5:30 PM"
        company4["offeringintern"] = "NO"
        company4["website"] = "https://www.redhat.com/en/jobs"
        company4["location"] = "100 East Davie Street Raleigh, NC "
        company4["id"] = "3"
        
        var company5 = [String:String]()
        company5["name"] = "Predixion Software"
        company5["meetingDesc"] = "Conference on on Hadoop big data as there's a big revolution happening in the world of big data, using business intelligence and predictive analytics, and Predixion applying that to such verticals as healthcare."
        company5["date"] = "11-11-2016"
        company5["time"] = "11:00 AM"
        company5["offeringintern"] = "YES"
        company5["website"] = "https://www.predixionsoftware.com/careers"
        company5["location"] = "100 John Haden Street, Aliso Viejo, CA "
        company5["id"] = "4"
        

        
        
        let coredataObj = CoreDataHelper()
        
        let boolVal1 = coredataObj.saveCompanyDetails(company1)
        let boolVal2 = coredataObj.saveCompanyDetails(company2)
        let boolVal3 = coredataObj.saveCompanyDetails(company3)
        let boolVal4 = coredataObj.saveCompanyDetails(company4)
        let boolVal5 = coredataObj.saveCompanyDetails(company5)

        if  boolVal1==true
        {


        }
        if  boolVal2==true
        {
            
            
        }
        if  boolVal3==true
        {
            
            
        }
        if  boolVal4==true
        {
            
            
        }
        if  boolVal5==true
        {
            
            
        }
        
        
        
        
        
    }
    
    
    

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "ITMeeting.ITMeeting" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("ITMeeting", withExtension: "momd")!
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
    func dateComponentFromNSDate(date: NSDate)-> NSDateComponents{
        
        let calendarUnit: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
        let dateComponents = NSCalendar.currentCalendar().components(calendarUnit, fromDate: date)
        return dateComponents
    }

}

