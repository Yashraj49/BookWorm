//
//  TutorialView2.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

//Core Data is an object graph and persistence framework, which is a fancy way of saying it lets us define objects and properties of those objects, then lets us read and write them from permanent storage.

//Core Data is capable of sorting and filtering of our data, and can work with much larger data – there’s effectively no limit to how much data it can store. Even better, Core Data implements all sorts of more advanced functionality for when you really need to lean on it: data validation, lazy loading of data, undo and redo, and much more.
//how to set up Core Data by hand. It takes three steps,

//starting with us defining the data we want to use in our app.

import SwiftUI

struct TutorialView2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct Student {
//    var id : UUID
//    var name : String
//}

//Core Data doesn’t work like that. You see, Core Data needs to know ahead of time what all our data types look like, what it contains, and how it relates to each other. so This is all contained in a new file type called Data Model, which has the file extension “xcdatamodeld”

//second step of setting up Core Data: writing a little Swift code to load that model and prepare it for us to use.

struct TutorialView2_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView2()
    }
}
