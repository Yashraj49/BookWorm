//
//  AddBookView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 07/03/23.
//

import SwiftUI

struct AddBookView: View {
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    

    
    @Environment(\.managedObjectContext) var moc
    
    @Environment(\.dismiss) var dismiss
    
    var hasValidAddress : Bool {
        if title.isEmpty || author.isEmpty || rating.description.isEmpty || review.isEmpty {
            return false
        }
        
        if title.isAllWhiteSpaces || author.isAllWhiteSpaces ||  review.isAllWhiteSpaces {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review

                        try? moc.save()
                        dismiss()
                    }
                    .disabled(!hasValidAddress)
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

fileprivate extension String {
    
    
    var isAllWhiteSpaces : Bool {
        guard !self.isEmpty else {return false}
        return self.drop(while: {$0 == " "}).isEmpty
    }
}
