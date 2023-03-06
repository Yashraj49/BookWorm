//
//  TutorialView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//



 //MARK: - This file is not part of the project but contains the concepts and sample codes used in the project.


//******************************** Creating a custom component with @Binding ******************************************


import SwiftUI

struct TutorialView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me ", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
       
        
        //        Toggle("Remember Me ??" , isOn: $rememberMe)
        
        //the toggle needs to change our Boolean when the user interacts with it, but how does it remember what value it should change?
        
        
        // That’s where @Binding comes in: it lets us store a mutable value in a view that actually points to some other value from elsewhere. In the case of Toggle, the switch changes its own local binding to a Boolean, but behind the scenes that’s actually manipulating the @State property in our view.
        
        //  This makes @Binding extremely important for whenever you want to create a custom user interface component.
        
        
        //  @Binding is what sets SwiftUI Views apart: while they might have their local @State properties, they also expose @Binding properties that let them interface directly with other views.
        
    }
    
//    What’s happening here is that we’ve defined a one-way flow of data: ContentView has its rememberMe Boolean, which gets used to create a PushButton – the button has an initial value provided by ContentView. However, once the button was created it takes over control of the value: it toggles the isOn property between true or false internally to the button, but doesn’t pass that change back on to ContentView.
    
    }

 //MARK: -  ContentView is storing one value, and PushButton another. Fortunately, this is where @Binding comes in: it allows us to create a two-way connection between PushButton and whatever is using it, so that when one value changes the other does too.

struct PushButton : View {
    let title : String
    @Binding var isOn : Bool
    
    var onColors = [Color.red , Color.yellow]
    var offColors = [Color(white:0.6) , Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}


