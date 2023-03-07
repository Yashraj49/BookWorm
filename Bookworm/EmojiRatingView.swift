//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 07/03/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16

    var body: some View {
        switch rating {
        case 1:
            Text("😞")
        case 2:
            Text("😐")
        case 3:
            Text("😊")
        case 4:
            Text("😁")
        default:
            Text("😆")
        }
    }
}


//Notice how that specifically uses Int16, which makes interfacing with Core Data easier. And that’s the entire view done – it really is that simple.

//We don’t need to provide an identifier for the ForEach because all Core Data’s managed object class conform to Identifiable automatically, but things are trickier when it comes to creating views inside the ForEach.

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
