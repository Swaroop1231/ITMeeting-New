//
//  StudentRegisterDetails+CoreDataProperties.swift
//  ITMeeting
//
//  Created by test on 29/07/16.
//  Copyright © 2016 ITMeeting. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension StudentRegisterDetails {

    @NSManaged var name: String?
    @NSManaged var password: String?

}
