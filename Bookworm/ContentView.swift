//
//  ContentView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = true
    @Environment(\.managedObjectContext) var moc
    
    //    creates a fetch request with no sorting, and places it into a property called students that has the the type FetchedResults<Student>.
        
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    

    var body: some View {
        VStack{
            List(students) {student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                // More to come
                
                // we’re going to create a Student object, using the class Core Data generated for us. This needs to be attached to a managed object context, so the object knows where it should be stored. We can then assign values to it just like we normally would for a struct.
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName)\(chosenLastName)"
                
//                Finally we need to ask our managed object context to save itself, which means it will write its changes to the persistent store. This is a throwing function call, because in theory it might fail. In practice, nothing about what we’ve done has any chance of failing, so we can call this using try? – we don’t care about catching errors.
                
                try? moc.save()
                
            }
        }
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
