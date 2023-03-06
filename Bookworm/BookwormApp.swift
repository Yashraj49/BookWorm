//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @State private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
//            @Environment when it came to asking SwiftUI to dismiss our view, but it also stores other useful data such as our time zone, user interface appearance, and more.
            
//            This is relevant to Core Data because most apps work with only one Core Data store at a time, so rather than every view trying to create their own store individually we instead create it once when our app starts, then store it inside the SwiftUI environment so everywhere else in our app can use it.
        }
    }
}
