//
//  DataController.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

import Foundation
import CoreData

//final step is to create an instance of DataController and send it into SwiftUI’s environment.



//We’re going to start by creating a new class called DataController, making it conform to ObservableObject so that we can use it with the @StateObject property wrapper – we want to create one of these when our app launches, then keep it alive for as long as our app runs.

//Inside this class we’ll add a single property of the type NSPersistentContainer, which is the Core Data type responsible for loading a data model and giving us access to the data inside. From a modern point of view this sounds strange, but the “NS” part is short for “NeXTSTEP”, which was a huge operating system that Apple acquired when they brought Steve Jobs back into the fold in 1997 – Core Data has some really old foundations!

class DataController : ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    
    //That tells Core Data we want to use the Bookworm data model. It doesn’t actually load it – we’ll do that in a moment – but it does prepare Core Data to load it. Data models don’t contain our actual data, just the definitions of properties and attributes like we defined a moment ago.
    
    
    //write a small initializer for DataController that loads our stored data immediately. If things go wrong – unlikely, but not impossible – we’ll print a message to the Xcode debug log
    init() {
        container.loadPersistentStores { description, error in
            // loadPersistentStores handles loading the actual data we have saved to the user’s device.
//            you just met the third piece of the Core Data puzzle: managed object contexts. These are effectively the “live” version of your data – when you load objects and change them, those changes only exist in memory until you specifically save them back to the persistent store.
            
//            Retrieving information from Core Data is done using a fetch request – we describe what we want, how it should sorted, and whether any filters should be used, and Core Data sends back all the matching data. We need to make sure that this fetch request stays up to date over time, so that as students are created or removed our UI stays synchronized.
            
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}

// BookWormApp.swift


//@main
//struct BookwormApp: App {
//    @State private var dataController = DataController()
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
//            @Environment when it came to asking SwiftUI to dismiss our view, but it also stores other useful data such as our time zone, user interface appearance, and more.
            
//            This is relevant to Core Data because most apps work with only one Core Data store at a time, so rather than every view trying to create their own store individually we instead create it once when our app starts, then store it inside the SwiftUI environment so everywhere else in our app can use it.
//        }
//    }
//}

