//
//  Order+CoreDataProperties.swift
//  PizzaRestaurant
//
//  Created by Artsiom Sakratar on 10/4/20.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var tableNumber: String
    @NSManaged public var pizzaType: String
    @NSManaged public var numberOfSlices: Int16
    @NSManaged public var id: UUID?
    
    @NSManaged public var status: String
    
    var orderStatus: Status {
        set {
            status = newValue.rawValue
        }
        get {
            Status(rawValue: status) ?? .pending
        }
    }

}

extension Order : Identifiable {

}

enum Status: String {
    case pending = "Pending"
    case preparing = "Preparing"
    case completed = "Completed"
}
