//
//  WelcView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 17/07/23.
//

import SwiftUI

struct WelcView: View {
    @State private var isNextViewActive = false
    @State private var dataController = DataController()
    
    var body: some View {
        NavigationView {
            VStack {
                Color("ColorX")
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxHeight: 230)
                
                Spacer()
            
                VStack(spacing: 0) {
                    Image("Img1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 320, height: 230)
                        .clipped()
                        .cornerRadius(20)
                        .padding(.top)
                    
                    Text("Keep reviewing")
                        .font(Font.custom("Work Sans", size: 34).weight(.heavy))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorY"))
                        .padding(.top, 20)
                }
                
                Spacer()
                
                Text("You’ll fall in love")
                    .font(Font.custom("Work Sans", size: 20).weight(.bold))
                    .foregroundColor(Color("ColorY"))
                    .padding(.top, 20)
                
                Text(
                    """
                    Discover and review your favorite books.
                    Explore a vast collection of books in multiple languages,
                    and share your thoughts with the community.
                    """
                )
                .font(Font.custom("Work Sans", size: 13))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("ColorY"))
                .frame(width: 329, height: 92, alignment: .top)
                .padding(.top, 10)
                .padding(.vertical)
                
                Button(action: {
                    isNextViewActive = true
                }) {
                    Text("Start Reviewing")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.pink)
                        )
                }
                .padding(.bottom, 50)
                .sheet(isPresented: $isNextViewActive) {
                    ContentView()
                        .environment(\.managedObjectContext, dataController.container.viewContext)
                }
                .animation(.easeInOut) // Apply animation when the sheet appears
            }
            .background(Color("ColorX"))
            .navigationTitle("BookWorm")
        }
    }
}





struct WelcView_Previews: PreviewProvider {
    static var previews: some View {
        WelcView()
    }
}
