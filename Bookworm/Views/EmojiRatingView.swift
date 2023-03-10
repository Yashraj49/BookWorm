//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 07/03/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        let emoji: String
        let color: Color
        
        switch rating {
        case 1:
            emoji = "😞"
            color = .red
        case 2:
            emoji = "😐"
            color = .orange
        case 3:
            emoji = "😊"
            color = .yellow
        case 4:
            emoji = "😁"
            color = .green
        default:
            emoji = "🤩"
            color = .purple
        }
        
        return Text(emoji)
            .font(.system(size: 50))
            .foregroundColor(color)
            .scaleEffect(scale)
            .animation(.spring(response: 0.3, dampingFraction: 0.5))
            .onTapGesture {
                withAnimation {
                    scale = 1.2
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        scale = 1.0
                    }
                }
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
