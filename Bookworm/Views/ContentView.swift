//
//  ContentView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: [
            SortDescriptor(\.title),
            SortDescriptor(\.author)
        ]
    ) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                if books.isEmpty {
                    Text("No books found")
                        .foregroundColor(.secondary)
                        .font(.title)
                        .padding()
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink(
                                destination: DetailView(book: book)
                            ) {
                                BookRow(book: book)
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddScreen = true
                    }) {
                        Image(systemName: "plus")
                        Text("Add Book")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title ?? "Unknown Title")
                    .font(.headline)
                    .foregroundColor(book.rating == 1 ? .red: .primary)
                
                Text(book.author ?? "Unknown Author")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
