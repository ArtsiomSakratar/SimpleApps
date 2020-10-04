//
//  PizzaRestaurantApp.swift
//  PizzaRestaurant
//
//  Created by Artsiom Sakratar on 10/4/20.
//

import SwiftUI

@main
struct PizzaRestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
