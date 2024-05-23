//
//  JournalEntryView.swift
//  LeafyLog
//
//  Created by Ankit on 5/23/24.
//

import SwiftUI

struct JournalEntryView: View {
    
    let entry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.title).font(.headline)
            Text(entry.content).font(.body)
            Text("\(Date(timeIntervalSince1970: entry.createdDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
        }.padding()
    }
}

#Preview {
    JournalEntryView(entry: .init(id: "123", title: "My First Entry", content: "Today I did something amazing!", createdDate: Date().timeIntervalSince1970, userId: "exampleUserId"))
}


