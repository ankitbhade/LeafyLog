//
//  LogItemView.swift
//  LeafyLog
//
//  Created by Ankit on 5/15/24.
//

import SwiftUI

// A view displaying a single log item
// This view shows the title and due date of a log item and allows toggling its completion status
struct LogItemView: View {
    
    // Set viewModel to LogItemViewVM
    @StateObject var viewModel = LogItemViewVM()
    
    // The log item to be displayed
    let item: LogItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // Title
                Text(item.title).font(.body)
                // Due date
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            // Button to toggle the completion status of the log item
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
    }
}

#Preview {
    LogItemView(item: .init(id: "123", title: "Get bananas", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
