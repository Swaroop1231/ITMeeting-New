//
//  FavouriteMeetingDetails+CoreDataProperties.swift
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

extension FavouriteMeetingDetails {

    @NSManaged var name: String?
    @NSManaged var id: String?
    @NSManaged var time: String?
    @NSManaged var date: String?
    @NSManaged var location: String?

}
