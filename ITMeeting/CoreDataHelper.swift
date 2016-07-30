//
//  CoreDataHelper.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//

import CoreData
import UIKit
class CoreDataHelper: NSObject
{

    
    func saveStudentRegisterDetails(name : String , password:String)-> Bool
    {
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let person = NSEntityDescription.insertNewObjectForEntityForName("StudentRegisterDetails", inManagedObjectContext: managedContext)
        
        // add our data
        person.setValue(name, forKey: "name")
        person.setValue(password, forKey: "password")
        
        // save it
        do {
            // this was the problem ///////////////
            try managedContext.save()
            
            return true
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
            
            //return false
            
        }
        //   return false
        
    }
    
    
    func fetchStudentDetails(name:String, password:String) -> Bool
    {
        
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let predicate = NSPredicate(format: "name == %@ AND password == %@", name,password)
        
        let fetchRequest = NSFetchRequest.init(entityName: "StudentRegisterDetails")
        fetchRequest.predicate = predicate
        //fetchRequest.sortDescriptors = [] //optionally you can specify the order in which entities should ordered after fetch finishes
          var results = []
        do
        {
            
            results = try managedContext.executeFetchRequest(fetchRequest) as! [StudentRegisterDetails]
            if results.count > 0
            {
                
                return true
                
            }
            else
            {

                return false

            }
            
        } catch
        {
            // handle error
        }
        

        return false

        
    }
    
    
    func saveCompanyDetails(dict : [String:String])-> Bool
    {
        
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let person = NSEntityDescription.insertNewObjectForEntityForName("CompanyDetails", inManagedObjectContext: managedContext)
        
        // add our data
        person.setValue(dict["name"], forKey: "name")
        person.setValue(dict["meetingDesc"], forKey: "meetingdescription")
        person.setValue(dict["date"], forKey: "date")
        person.setValue(dict["time"], forKey: "time")
        person.setValue(dict["offeringintern"], forKey: "offeringintern")
        person.setValue(dict["website"], forKey: "website")
        person.setValue(dict["location"], forKey: "location")
        person.setValue(dict["id"], forKey: "id")




        
        // save it
        do {
            // this was the problem ///////////////
            try managedContext.save()
            
            return true
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
            
            //return false
            
        }
        //   return false
        
    }
    
    func fetchCompanyDetails() -> [CompanyDetails]!
    {
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request :NSFetchRequest = NSFetchRequest(entityName: "CompanyDetails")
        request.returnsObjectsAsFaults = false
        //  let error: NSError? = nil
        
        var matches = [CompanyDetails]()
    
        do
        {
            
            matches = try managedContext.executeFetchRequest(request) as! [CompanyDetails]
            if matches.count > 0
            {
                return matches
            }
            else
            {
                
                
            }
            
        } catch
        {
            // handle error
        }
        
        return nil
    }
    
    
    func fetchParticularCompanyDetails(idVal :String) -> CompanyDetails?
    {
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request :NSFetchRequest = NSFetchRequest(entityName: "CompanyDetails")
        let predicate = NSPredicate(format: "id == %@", idVal)

        request.returnsObjectsAsFaults = false
        request.predicate=predicate
        //  let error: NSError? = nil
        
        var matches = [CompanyDetails]()
        
        do
        {
            
            matches = try managedContext.executeFetchRequest(request) as! [CompanyDetails]
            if matches.count > 0
            {
                return matches[0]
            }
            else
            {
                
                
            }
            
        } catch
        {
            // handle error
        }
        
        return nil
    }

    
    func favouriteMeetingDetails(dict : [String:String])-> Bool
    {
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let person = NSEntityDescription.insertNewObjectForEntityForName("FavouriteMeetingDetails", inManagedObjectContext: managedContext)
        
        // add our data
        person.setValue(dict["name"], forKey: "name")
        person.setValue(dict["date"], forKey: "date")
        person.setValue(dict["time"], forKey: "time")
        person.setValue(dict["location"], forKey: "location")
        person.setValue(dict["id"], forKey: "id")
        
        
        // save it
        do {
            // this was the problem ///////////////
            try managedContext.save()
            
            return true
        }
        catch
        {
            fatalError("Failure to save context: \(error)")
            
            //return false
            
        }
        //   return false
        
    }
    
    
    func fetchAttendingCompanyDetails() -> [FavouriteMeetingDetails]!
    {
        
        let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let request :NSFetchRequest = NSFetchRequest(entityName: "FavouriteMeetingDetails")
        request.returnsObjectsAsFaults = false
        //  let error: NSError? = nil
        
        var matches = [FavouriteMeetingDetails]()
        
        do
        {
            
            matches = try managedContext.executeFetchRequest(request) as! [FavouriteMeetingDetails]
            if matches.count > 0
            {
                return matches
            }
            else
            {
                
                
            }
            
        } catch
        {
            // handle error
        }
        
        return []
    }
    


}
