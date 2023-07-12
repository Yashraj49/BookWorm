//
//  RatungView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 07/03/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label: String = ""
    var maximumRating: Int = 5
    var offImage: Image? = nil
    var onImage: Image = Image(systemName: "star.fill")
    var offColor: Color = Color.gray
    var onColor: Color = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Image(systemName: number > rating ? "star" : "star.fill")
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maximumRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }
    }
    
    func image(for number: Int) -> Image {
        return Image(systemName: number > rating ? "star" : "star.fill")
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
