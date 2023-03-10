//
//  RatungView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 07/03/23.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating : Int
    
    var label = ""
    
    var maximumRating = 5
    
    var offImage : Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) {number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number : Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else  {
            return onImage
        }
    }
    
}

extension Image {
    static var filledStar: Image {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .font(.system(size: 20, weight: .regular)) as! Image
    }
}



struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        
//        SwiftUI has a specific and simple solution for this called constant bindings. These are bindings that have fixed values, which on the one hand means they can’t be changed in the UI, but also means we can create them trivially – they are perfect for previews.
        
        RatingView(rating:.constant(4))
    }
}
