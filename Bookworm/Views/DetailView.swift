//
//  DetailView.swift
//  Bookworm
//
//  Created by Yashraj jadhav on 08/03/23.
//
import CoreData
import SwiftUI

struct DetailView: View {
    let book: Book
    
    var formattedDate: String {
        guard let date = book.date else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return "Reviewed on \(formatter.string(from: date))"
    }
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    
                    .cornerRadius(20) // Add corner radius here
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(book.title ?? "Unknown Book")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text(book.author ?? "Unknown Author")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(book.review ?? "No review")
                    .font(.body)
                    .padding(.bottom)
                
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
            }
            .padding()
            
            Spacer()
            
            Text(formattedDate)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding()
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure you want to delete this book?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook() {
        moc.delete(book)
        dismiss()
    }
}



struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
       // book.date = Date.now
        
        return NavigationView {
            DetailView(book: book)
        }
        
        
    }
}

//creating a managed object context involves telling the system what concurrency type we want to use. This is another way of saying “which thread do you plan to access your data using?” For our example, using the main queue – that’s the one the app was launched using – is perfectly fine.
