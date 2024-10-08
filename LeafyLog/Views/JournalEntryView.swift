//
//  JournalEntryView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import SwiftUI

// A view that displays a single journal entry with its title, content, and creation date
struct JournalEntryView: View {
    
    // The journal entry to be displayed
    let entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text(entry.title).font(.headline)
            // Conent
            Text(entry.content).font(.body)
            // Creation Date
            Text("\(Date(timeIntervalSince1970: entry.createdDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
        }.padding()
    }
}

#Preview {
    JournalEntryView(entry: .init(id: "123", title: "My First Entry", content: "Today I did something amazing!", createdDate: Date().timeIntervalSince1970, userId: "exampleUserId"))
}


