//
//  TutorialView1.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

//We’ve used SwiftUI’s TextField view several times already, and it’s great for times when the user wants to enter short pieces of text. However, for longer pieces of text you should switch over to using a TextEditor view instead: it also expects to be given a two-way binding to a text string, but it has the additional benefit of allowing multiple lines of text – it’s much better for accepting longer strings from the user.

import SwiftUI

struct TutorialView1: View {
    @AppStorage("notes") private var notes = ""
    
//    @AppStorage is not designed to store secure information, so never use it for anything private.
    
    var body: some View {
        NavigationView{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct TutorialView1_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView1()
    }
}
